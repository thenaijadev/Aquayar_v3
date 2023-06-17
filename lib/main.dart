import 'package:aquayar/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: "/",
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

// MultiBlocProvider(
//       providers: const [
//         // BlocProvider(
//         //   create: (context) => AuthBloc(FirebaseAuthProvider())
//         //     ..add(const AuthEventInitialize()),
//         // ),
//       ],