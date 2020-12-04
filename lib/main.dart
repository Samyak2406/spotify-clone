import 'package:flutter/material.dart';
import 'package:spotify/homepage.dart';
import 'package:spotify/signIn.dart';
import 'homepage.dart';
import 'logIn.dart';
import 'mylibrary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: mylibrary.id,
      routes: {
        homepage.id:(context)=>homepage(),
        signIn.id:(context)=>signIn(),
        logIn.id:(context)=>logIn(),
        mylibrary.id:(context)=>mylibrary(),
      },
    );
  }
}
