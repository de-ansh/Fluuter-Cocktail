import 'package:cocktail/screens/home_page.dart';
import 'package:flutter/material.dart';

const Color myColor = Colors.brown;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "cocktail App",
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}
