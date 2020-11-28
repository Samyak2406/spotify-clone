import 'package:flutter/material.dart';
import 'constants.dart';

class signIn extends StatelessWidget {
  static const id = "signIn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
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
//                    TODO:
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
