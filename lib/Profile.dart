import "package:flutter/material.dart";
import 'package:flutterbasics/header.dart';
 
 class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileState();
  }
   
 }
  class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: header(context, apptitle: true, text: "Profile"),
      body: Center(
        child:Text("Profile")
      ),
      );;
  }
    
  }