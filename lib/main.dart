import 'package:flutter/material.dart';

void main() {
  runApp(const NumioApp());
}

class NumioApp extends StatelessWidget {
  const NumioApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numio - Calculator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Colors.green,
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Welcome to Numio Calculator!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}