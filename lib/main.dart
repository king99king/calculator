import 'package:calculator/buttons.dart';
import 'package:calculator/dataApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calcPage.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 // const MyHomePage({Key? key, required this.title}) : super(key: key)
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override

  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(userQuestion,
            style: TextStyle(
            color: Colors.deepPurple,fontSize: 20)
            ),
            ),

            SizedBox(height: 30,),
            Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(userAnsewer,
            style: TextStyle(
            color: Colors.deepPurple,fontSize: 30)
            ),
            ),

            SizedBox(height: 50,),
   Expanded(
           child: Container(
             child: GridView.builder(
               itemCount: buttonsList.length,
                itemBuilder: (BuildContext context, int index) {
                 if (index ==0){
                   return Buttons(
                     buttonTaped: (){
                       setState(() {
                         userQuestion='';
                         userAnsewer='';
                       });
                     },
                     buttonText:buttonsList[index],
                     color: Colors.green,
                     textColor: Colors.white,
                   );
                 }else if (index==buttonsList.length-1){
                   return Buttons(
                     buttonTaped: (){
                       setState(() {
                         equalPressed();
                       });
                     }, buttonText: buttonsList[index],
                     color: Colors.deepPurple,
                     textColor: Colors.white,
                   );

                 }else if (index==1){
                     return Buttons(
                       buttonTaped:() {
                         setState(() {
                           userQuestion=userQuestion.substring(
                             0,userQuestion.length-1
                           );
                         });
                       },

                         buttonText: buttonsList[index],
                         color: Colors.red,
                         textColor: Colors.white,
                     );
                 }else{
                   return Buttons(
                       buttonTaped: (){
                         setState(() {
                           userQuestion +=buttonsList[index];
                         });

                       },
                       buttonText: buttonsList[index],
                       color:  isOperator( buttonsList[index])
                     ? Colors.deepPurple
                           :Colors.deepPurple[50],
                     textColor:  isOperator( buttonsList[index])
                         ? Colors.white
                         :Colors.deepPurple,

                   );
                 }
                },

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,

                ),
              ),
           ),
   )]),
        ),

    ) ;
  }
  bool isOperator(String x) {
   if (x=='%' || x=='/' || x=='x'|| x=='-' ||x=='=' ||x=='+'){
     return true;
   }
   return false;
  }

}
