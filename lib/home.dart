import 'dart:developer';
import 'package:flutterbasics/Timeline.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";

import 'ActivityFeed.dart';
import 'Profile.dart';
import 'Search.dart';
import 'Upload.dart';


final GoogleSignIn googlesignin=GoogleSignIn();

class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homestate();
  }

}
  class _homestate extends State<home>{
    bool auth=false;
    int pageindex=0;
    PageController Pagecontroller;

    @override
    void initState() { 
      super.initState();
      Pagecontroller=PageController(
        initialPage: 2
      );
      googlesignin.onCurrentUserChanged.listen((account){
        if(account != null){
          print("User Signned in : $account");
          setState((){
            auth=true;
          });
        }
        else{
          setState((){
            auth=false;
          });
        }

      }, onError: (err){
        print("error: $err");
      });
    }
@override
void dispose(){
super.dispose();
Pagecontroller.dispose();
}

    login(){
      googlesignin.signIn();
      
    }

    logout(){
      googlesignin.signOut();
    }

    Pagechanged(int pageindex){
      setState(() {
        this.pageindex= pageindex;
      });
      
    }

    onTap(int pageindex){
      Pagecontroller.jumpToPage(pageindex);
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return auth ?success():failed();
          }
        
          failed() {
            return Scaffold(
              appBar: AppBar(title:Text("Appbar")),
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin:Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.teal,
                      Colors.deepPurple
                    ] )
                ),
              child:Center(
                child:RaisedButton(
                  child:Text("Login"),
                  onPressed: (){ 
                    login();
                  }
                  )
              )
            )
            );
          }
    
      success() {
        
                return Scaffold(
                      appBar: AppBar(title:Text("Appbar")),
                      body: PageView(
                        children: <Widget>[
                          Timeline(),
                          ActivityFeed(),
                          Upload(),
                          Search(),
                          Profile(),
                        ],
                        controller: Pagecontroller,
                        onPageChanged: Pagechanged,
                        physics: NeverScrollableScrollPhysics(),
                        
                ),
                bottomNavigationBar: CupertinoTabBar(
                  currentIndex: pageindex,
                  onTap: onTap,
                  activeColor: Colors.deepPurple,
                  items:[
                    BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
                    BottomNavigationBarItem(icon: Icon(Icons.credit_card)),
                    BottomNavigationBarItem(icon: Icon(Icons.arrow_drop_up)),
                    BottomNavigationBarItem(icon: Icon(Icons.search)),
                    BottomNavigationBarItem(icon: Icon(Icons.contacts)),
                  ] ),
        );
      }

  }
  
