import "package:flutter/material.dart";
 
 AppBar header(context,{bool apptitle=false , String text}){
   return AppBar(
     title:Text(
       apptitle ? text : "FlutterBasics",
       style: TextStyle(
         color: apptitle ? Colors.white : Colors.yellow[900]
       ),
     ) ,
     centerTitle: true,
     backgroundColor: Colors.deepPurple,);
 }