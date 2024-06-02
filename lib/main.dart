import 'package:api_apps/screen_five.dart';
import 'package:api_apps/screen_four.dart';
import 'package:api_apps/screen_three.dart';
import 'package:flutter/material.dart';
import 'package:api_apps/home_screen.dart';
//import 'package:http/http.dart' as http;
import 'package:api_apps/screen_two.dart';

void main() {
  runApp(const MyApp());
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
        useMaterial3: true,
      ),
      home: const LastExampleScreen(),
    );
  }
}
