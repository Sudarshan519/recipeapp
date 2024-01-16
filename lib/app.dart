import 'package:flutter/material.dart';
import 'package:recipeapp/screens/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          sliderTheme: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
          )),
      home: const MyHomePage(),
    );
  }
}
