import 'package:aquayar/router/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      onGenerateRoute: appRouter.onGenerateRoute,
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