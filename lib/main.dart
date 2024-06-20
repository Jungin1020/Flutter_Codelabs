import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 200,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              fontSize: 72,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              fontSize: 56,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.normal),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
