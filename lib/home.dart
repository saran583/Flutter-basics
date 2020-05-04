import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";


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

    @override
    void initState() { 
      super.initState();
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

    login(){
      googlesignin.signIn();
      
    }

    logout(){
      googlesignin.signOut();
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
              body: Center(
                child: Column(
                   children: <Widget> [ Text("Authenticated"),
                   RaisedButton(
                  child:Text("Logout"),
                  onPressed: (){ 
                    logout();
                  }
                  )
                   ]),
                        
            )
        );
      }

  }
  
