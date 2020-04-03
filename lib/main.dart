import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title:"Basics",
    home: MyApp()
  )
  );
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
  
}

class _MyAppState extends State<MyApp>{
String valu="Select a City";
var currencies=["A","B","C","D","E"];

  String selected = "B";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("First Page")
      ),
      body:Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
        children: <Widget>[
          TextField(
            style: TextStyle(
              fontSize: 25
            ),
            onSubmitted: (String inp){
              setState(() {
                if(inp==""){
                  valu= "Cant't Leave it empty";
                }
                else{
                  valu="The city $inp is Available";
                }
              });
            }
          ),
          DropdownButton<String>(
            items: currencies.map((String DropDownItems){
              return DropdownMenuItem<String>(
                value:DropDownItems,
                child:Text(DropDownItems),
                );
              }).toList(),
            onChanged: (String newvalue){
               setState(() {
                 this.selected=newvalue;
               });

             },
             value:selected
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child:Text(valu),
            )
          
        ],
      )
      )
    );
  }
  

}