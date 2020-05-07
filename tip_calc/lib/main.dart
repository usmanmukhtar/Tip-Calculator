import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double billAmount = 0;
  double tipPercentage = 5.0;
  double people = 0;
  double tip = 0;
  double totalAmount = 0;

  void tipPercentageInc(){
    setState(() {
      tipPercentage++;
    });
  }

  void tipPercentageDec(){
    setState(() {
      tipPercentage--;
    });
  }

  void peopleDec(){
    setState(() {
      people--;
    });
  }

  void peopleInc(){
    setState(() {
      people++;
    });
  }

  void tipCalc(){
    if(people == 1 ){
        setState(() {
          tip = billAmount * (tipPercentage / 100);
          totalAmount = billAmount + tip;
        });
    }else {
      setState(() {
        tip = billAmount * (tipPercentage / 100);
        double billPerPerson = billAmount / people;
        totalAmount = billPerPerson + tip;
      });

          
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text("Tip Calculator", style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50,),
          TextField(
            onChanged: (value){
              billAmount = double.parse(value);
            },
            decoration: InputDecoration(
              hintText: "Bill Amount"
            ),
          ),
          SizedBox(height: 20,),
          Row(children: <Widget>[
            Text("Tip %"),
            Spacer(),
            GestureDetector(
              onTap: (){
                tipPercentageDec();
              },
              child: Icon(Icons.arrow_left),
              ),
              Text("${tipPercentage} %"),
              GestureDetector(
              onTap: (){
                tipPercentageInc();
              },
              child: Icon(Icons.arrow_right),
              ),
          ],
          ),
          SizedBox(height: 16,),
          Row(children: <Widget>[
            Text("People"),
            Spacer(),
            GestureDetector(
              onTap: (){
                peopleDec();
              },
              child: Icon(Icons.arrow_left),
              ),
              Text("${people}"),
              GestureDetector(
              onTap: (){
                peopleInc();
              },
              child: Icon(Icons.arrow_right),
              ),
          ],
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){
              tipCalc();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: BoxDecoration(color: Colors.green),
              child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 17),),
            ),
          ),
          SizedBox(height: 16,),
          Text("Total tip: $tip"),
          SizedBox(height: 8,),
          Text("Total Amount: $totalAmount"),
        ],),
      ),
    );
  }
}