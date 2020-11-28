import 'package:flutter/material.dart';

String pwd="";
String userEmail="";
bool Cauth=false;

var leftbar = Color(0xff040404);
var topbar = Color(0xff090909);
var bgcolor = Color(0xff121212);
var sign = TextStyle(
  color: Colors.white,
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

var log = TextStyle(
  color: Colors.black,
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

var sidebar =TextStyle(
  color: Colors.grey,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

var selectedSidebar =TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

var cardtitle =TextStyle(
  color: Colors.white,
  fontSize: 14,
  letterSpacing: 1.2,
  fontWeight: FontWeight.w700,
);

var cardsubtitle =TextStyle(
  color: Colors.grey,
  letterSpacing: 1.2,
  fontSize: 11,
  fontWeight: FontWeight.w400,
);

class songOuter{
  String path;
  String title;
  String subtitle;
  songOuter(
      this.path,
      this.title,
      this.subtitle
      );
}
