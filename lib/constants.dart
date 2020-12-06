import 'package:flutter/material.dart';

String pwd = "";
String userEmail = "";
bool Cauth = false;

var leftbar = Color(0xff040404);
var topbar = Color(0xff090909);
var bgcolor = Color(0xff121212);
var sign = TextStyle(
  color: Colors.white,
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

var tableTitle = TextStyle(
  color: Colors.grey.shade300,
  fontSize: 16,
);

var log = TextStyle(
  color: Colors.black,
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

var sidebar = TextStyle(
  color: Colors.grey,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

var selectedSidebar = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

var cardtitle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  letterSpacing: 1.2,
  fontWeight: FontWeight.w700,
);

var cardsubtitle = TextStyle(
  color: Colors.grey,
  letterSpacing: 1.2,
  fontSize: 11,
  fontWeight: FontWeight.w400,
);

class songOuter {
  String path;
  String title;
  String subtitle;

  songOuter(this.path, this.title, this.subtitle);
}

List<songOuter> songs = [
  songOuter("images/kabira.jpg", "Kabira", "Tochi Raina, Rekha Bhardwaj"),
  songOuter("images/bekhayali.jpg", "Kabir Singh", "Sachet Tandon"),
  songOuter("images/humnava mere.jpg", "Album Song", "Rocky-Shiv"),
  songOuter("images/dilbechara.jpg", "Dil Bechara", "A. R. Rahman"),
  songOuter("images/fihall.jpg", "Filhall", "B Praak"),
  songOuter("images/pachtaoge.jpg", "Pachataoge", "Arijit Singh"),
  songOuter("images/sunrahahai.jpg", "Aashiqui 2", "Ankit Tiwari"),
  songOuter("images/thodi jagah.jpg", "Marjaavaan", "Arijit Singh"),
  songOuter("images/valam.jpg", "Made in Chaina",
      "Priya Saraiya, Sachin–Jigar, Arijit Singh"),
  songOuter("images/khairiyat.jpg", "Chhichhore", "Arijit Singh"),
];
