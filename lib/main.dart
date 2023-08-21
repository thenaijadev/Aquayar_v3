import 'package:aquayar/app/bloc/auth/auth_bloc.dart';
import 'package:aquayar/app/bloc/order/order_bloc.dart';
import 'package:aquayar/app/bloc/user/user_bloc.dart';
import 'package:aquayar/app/data/models/address.dart';
import 'package:aquayar/app/data/repos/auth_repo.dart';
import 'package:aquayar/app/data/repos/order_repository.dart';
import 'package:aquayar/app/data/repos/user_repo.dart';
import 'package:aquayar/app/data/providers/location_provider.dart';
import 'package:aquayar/router/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter();
  Hive.registerAdapter(AddressAdapter());
  await Hive.openBox("user_token_box");
  await Hive.openBox<Address>("address");

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  supaBaseInti();

  runApp(const MyApp());
}

supaBaseInti() async {
  await Supabase.initialize(
    url: 'https://mwukqrbysdwiyonnjfoi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13dWtxcmJ5c2R3aXlvbm5qZm9pIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI0NDQyMDgsImV4cCI6MjAwODAyMDIwOH0.dscUW1smbhRJUs13-1jbw921WLtvMjK7d_vadyZxJ1w',
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return UserBloc(UserRepo.fromDio());
          },
        ),
        BlocProvider(
          create: (context) => AuthBloc(AuthRepo.fromDio(), UserRepo.fromDio()),
        ),
        BlocProvider(
          create: (context) =>
              OrderBloc(OrderRepo.fromDio(), LocationProvider()),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          theme: ThemeData(textTheme: const TextTheme()),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: "/",
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
