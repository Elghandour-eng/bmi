import 'package:flutter/material.dart';
import 'package:bmi2/genderenum.dart';

class GenderContainer extends StatelessWidget {
  String name;
  IconData icon;
  Gender g;
  Color color;
  GenderContainer({this.name, this.icon, this.g, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Column(
            children: [
              Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 100,
              )
            ],
          )),
    );
  }
}