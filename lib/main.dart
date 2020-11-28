import 'package:flutter/material.dart';
import 'package:spotify/homepage.dart';
import 'package:spotify/signIn.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: signIn.id,
      routes: {
        homepage.id:(context)=>homepage(),
        signIn.id:(context)=>signIn(),
      },
    );
  }
}
