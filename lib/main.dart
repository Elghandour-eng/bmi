
import 'package:bmi2/resultpage.dart';
import 'package:flutter/material.dart';
import 'inputpage.dart';

void main() {
  runApp(BMI());
}

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: InputPage.id,
      routes:
      {
       InputPage.id :(context)=>InputPage(),
       ResultPage.id :(context)=>ResultPage()
      },
    );
  }
}


