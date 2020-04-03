import 'package:toast/toast.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title:"App Title",
      home:Scaffold(
        appBar: AppBar(
          title:Text("AppBar")
        ),
        body:listView(),
      )
    )
  );
}

List<String> Generate(){
  var items=List<String>.generate(1000, (counter)=>"Item $counter");
return items;
}

Widget listView(){
 var items=Generate();

 var list=ListView.builder(
   itemBuilder:(context,index){
     return ListTile(
       leading:Icon(Icons.airport_shuttle),
       title:Text(items[index]),
       onTap: (){
         debugPrint("${items[index]} was clicked");
         Toast.show("${items[index]} was clicked",context,gravity: Toast.BOTTOM);
       },
     );
   });
   return list;
}