import 'package:flutter/material.dart';
import 'package:bmi2/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(BMI());
}

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Gender g;
  double height =150;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: scafcolor,
        appBar: AppBar(
          backgroundColor: scafcolor,
          title: Text(
            'BMI Calculter',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          g = Gender.Male;
                        });
                      },
                      child: GenderContainer(
                        g: g,
                        name: 'Male',
                        icon: FontAwesomeIcons.mars,
                        color: g == Gender.Male ? active : inactive,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            g = Gender.Female;
                          });
                        },
                        child: GenderContainer(
                          g: g,
                          name: 'Female',
                          icon: FontAwesomeIcons.venus,
                          color: g == Gender.Female ? active : inactive,
                        )),
                  ),
                ),
              ],
            ),
              Expanded(child:Container(decoration: BoxDecoration(color: active,
            borderRadius: BorderRadius.circular(30)
            ),
              child: Column(
                children: [
                  Text('Height',style: TextStyle(color: Colors.grey ,fontSize: 18),),
                  Text(height.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 40),),
                  Slider(max:250 ,min: 100,activeColor: Colors.pink,inactiveColor: Colors.grey,
                  value:height  ,
                  onChanged: (value)
                  {
                           setState(() {
                             height=value;
                           });
                  },
                  )

                ],

              ),
              ),

              )
          ],
        ),
      ),
    );
  }
}

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

enum Gender { Male, Female }
