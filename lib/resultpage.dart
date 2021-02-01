import 'package:bmi2/constants.dart';

import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
 static String id ='result';
final double bmi;
ResultPage({this.bmi,this.name});
final String name;
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafcolor,
     appBar: AppBar(
       backgroundColor: scafcolor,
       title: Text('BMI Claculater'),
       centerTitle: true,
     ),
     body:Column(
       children: [
         Text('Your Result ',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: 300,
             width: 500,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               color: active
             ),
             child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Text('Normal',style: TextStyle(color: Colors.green),),
                 Text(widget.bmi.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 70,fontWeight: FontWeight.bold),),
                 Text('you have a Normal body',style: TextStyle(color: Colors.white),)
               ],
             ),
           ),
         ),
         GestureDetector(onTap: ()
         {
           Navigator.pop(context);
         },
           child: Container(

             decoration: BoxDecoration(color: Colors.pink,
             borderRadius: BorderRadius.circular(30)),
             child:
             Text('RE-Calculate',style: TextStyle(color: Colors.white,fontSize: 30),),
           ),
         )
       ],
     )
    );

  }
}
