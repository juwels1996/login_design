import 'package:flutter/material.dart';
import 'package:kadad_customer_design/emailfield.dart';
import 'package:kadad_customer_design/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:ExerciseOne(),
    );
  }
}

