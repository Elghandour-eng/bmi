import 'package:bmi2/resultpage.dart';
import 'package:flutter/material.dart';
import 'genderenum.dart';
import 'constants.dart';
import 'genderclass.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
class InputPage extends StatefulWidget {
  static  String id ='input';
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  double bmi;
  Gender g = Gender.Male;
  double height = 150;
  int w = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: active, borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Text(
                    height.toStringAsFixed(1),
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Slider(
                    max: 250,
                    min: 100,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.grey,
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: active, borderRadius: BorderRadius.circular(20)),
                        child: buildColumn('Whight',w,(){
                          setState(() {
                            w++;
                          });
                        },()
                        {
                          setState(() {
                            w>1?w--:null;
                          });
                        }

                        ),
                      ),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: active, borderRadius: BorderRadius.circular(20)),
                        child: buildColumn('Age',age,(){
                          setState(() {
                            age++;
                          });
                        },()
                        {
                          setState(() {
                            age>1?age--:null;
                          });
                        }

                        ),
                      ),
                    )),
              ],
            ),
          ),

          Row(
              children: [



                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(onTap: ()
                  {
       Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultPage(bmi: calculate())));
                  },
                    child: Container
                      (
                      height: 45,
                      width:320 ,

                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Text('CalCulate BMI',style: TextStyle(
                            color: Colors.black,
                            fontSize: 25
                        ),),
                      ),
                    ),
                  ),
                ),


              ]
          ),

        ],
      ),
    );
  }

  Column buildColumn(String name, int variable,Function add, Function subtract) {



    return Column(
      children: [
        Text(
          name,
          style: TextStyle(color: Colors.grey, fontSize: 22.5),
        ),
        Text(
          variable.toString(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: add,
                child: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: subtract,
                child: Icon(
                  Icons.remove_circle,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

 calculate() {
    bmi = w / pow(height / 100, 2);
    return bmi;
  }
}