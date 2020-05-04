import "package:flutter/material.dart";
import 'package:flutterbasics/header.dart';


 
 class Timeline extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TimelineState();
  } 
 }

 class _TimelineState extends State<Timeline>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: header(context),
      body: Center(
        child:Text("Timeline")
      ),
      );
  }
   
 }