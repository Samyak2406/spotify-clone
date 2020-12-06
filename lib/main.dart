import 'package:flutter/material.dart';
import 'package:spotify/homepage.dart';
import 'package:spotify/likedSongs.dart';
import 'package:spotify/search.dart';
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
      initialRoute: homepage.id,
      routes: {
        homepage.id:(context)=>homepage(),
        signIn.id:(context)=>signIn(),
        logIn.id:(context)=>logIn(),
        mylibrary.id:(context)=>mylibrary(),
        likedSongs.id:(context)=>likedSongs(),
        search.id: (context)=>search(),
      },
    );
  }
}
