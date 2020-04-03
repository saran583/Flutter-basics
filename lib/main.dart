import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title:"Basics",
    home: MyApp()
  )
  );
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
  
}

class _MyAppState extends State<MyApp>{
String valu="Select a City";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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