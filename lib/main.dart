import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/view/ej_screen.dart';
import 'package:untitled/view/js_screen.dart';
import 'package:untitled/view/stopwatch_screen.dart';
import 'view/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoRouter _router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const MainScreen()),
    GoRoute(path: '/ejscreen', builder: (context, state) => const EjScreen()),
    GoRoute(path: '/jsscreen', builder: (context, state) => const JsScreen()),
    GoRoute(
        path: '/stopwatch',
        builder: (context, state) => const StopwatchScreen()),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}
