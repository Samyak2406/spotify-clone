import 'package:flutter/material.dart';
import 'constants.dart';
import 'homepage.dart';
import 'w_homePage.dart';
import 'likedSongs.dart';
import 'mylibrary.dart';
import 'package:line_icons/line_icons.dart';
import 'search.dart';

class hseparators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
    );
  }
}

class no1 extends StatelessWidget {
  List<bool> isSelected;

  no1(this.isSelected);
  void none() {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: leftbar,
        child: FractionallySizedBox(
          heightFactor: 1,
          child: Center(
            child: ListView(
              children: [
                Container(
                  height: AppBar().preferredSize.height * 1.4,
                  alignment: Alignment.bottomLeft,
                  child: FractionallySizedBox(
                    heightFactor: 0.85,
                    widthFactor: 0.8,
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: 0.8,
                      child: Image.asset("images/logo.png"),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isSelected[0]
                        ? none()
                        : Navigator.pushNamed(context, homepage.id);
                  },
                  child: homesidetiles(Icons.home, "Home", isSelected[0]),
                ),
                GestureDetector(
                  onTap: () {
                    isSelected[1]?none():Navigator.pushNamed(context, search.id);
                  },
                  child: homesidetiles(Icons.search, "Search", isSelected[1]),
                ),
                GestureDetector(
                  onTap: () {
                    isSelected[2]
                        ? none()
                        : Navigator.pushNamed(context, mylibrary.id);
                  },
                  child: homesidetiles(
                      Icons.library_add, "Library", isSelected[2]),
                ),
                SizedBox(
                  height: 25,
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Text(
                    "Liked Songs",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: (){
                      isSelected[4]?none():Navigator.pushNamed(context, likedSongs.id);
                    },
                    child: homesidetiles2(LineIcons.heart, "Liked Songs", isSelected[4])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

