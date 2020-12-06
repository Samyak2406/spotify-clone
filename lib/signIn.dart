//Here is the code of Sign Up
//There is typo in file name

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:spotify/homepage.dart';
import 'constants.dart';

final _store=FirebaseFirestore.instance;

class signIn extends StatelessWidget {
  static const id = "signIn";
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: Center(
          child: ListView(
//          shrinkWrap: true,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: AppBar().preferredSize.height * 2,
                child: Image.asset("images/logo.png"),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey.shade600.withOpacity(0.8),
              ),
              SizedBox(height: 50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(
                      -175,0
                    ),
                    child: Text(
                      "Email Id",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 400,
                    child: TextField(
                      onChanged: (Temail){
                      userEmail=Temail;
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(

                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
//                      labelText: "Email Address",
                        hintText: "Email Address",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(
                        -170,0
                    ),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 400,
                    child: TextField(

                      onChanged: (Tpwd){
//                    TODO:
                      pwd=Tpwd;
                      },
                      obscureText: true,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(

                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
//                      focusColor: Colors.black,
                        hintText: "Password",
                        border: OutlineInputBorder(

                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Transform.translate(
                    offset: Offset(0,0),
                    child: loginBox(_auth)
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class loginBox extends StatefulWidget {
  FirebaseAuth _auth;
  loginBox(this._auth);
  @override
  _loginBoxState createState() => _loginBoxState();

}

class _loginBoxState extends State<loginBox> {


  var greens=Color(0xff15883E);
  Future login() async {
//    print(userEmail+"  "+pwd);
    try {

      final UserCredential userCredential = await widget._auth
          .createUserWithEmailAndPassword(
        email: userEmail,
        password: pwd,
      );
//      print(userCredential);
      for (int i=0;i<songs.length;i++){
        _store.collection(userEmail).doc(i.toString()).set(
            {
              "liked": -1,
            }
        );
      }
    Cauth=true;

    Navigator.pushNamed(context, homepage.id);
    }
    catch(e){
      print("_");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_){
        setState(() {
          greens=Colors.green;
        });
      },
      onExit: (_){
        setState(() {
          greens=Color(0xff15883E);
        });
      },
      child: GestureDetector(
        onTap: (){
          //LOG IN
           login();
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 200,
          height: 50,
          child: Center(
            child: Text(
              "SIGN UP",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.5,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: greens,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
