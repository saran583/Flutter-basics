import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var val="hello";
    return MaterialApp(
      title:"my title",
      home: Scaffold(
        appBar: AppBar(
          title:Text("First page"),
        ) ,
        body: Material(
          child: Column(children: <Widget>[
          Center(
            child:new Text(val)
          ),
          RaisedButton(
            child: Text("Click here"),
            onPressed: (){
              val="hai";
            }
            )
          ],
        ),
        )
        )
    );
  }
}