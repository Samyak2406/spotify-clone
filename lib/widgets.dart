import 'package:flutter/material.dart';
import 'constants.dart';
import 'homepage.dart';
import 'w_homePage.dart';
import 'likedSongs.dart';
import 'mylibrary.dart';
import 'package:line_icons/line_icons.dart';

class playBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(top: 20),
        height: 100,
        width: double.infinity,
        color: Color(0xff282828),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.skip_previous,
                  size: 22,
                  color: Colors.white,
                ),
                hseparators(),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.play_arrow,
                    size: 30,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                hseparators(),
                Icon(
                  Icons.skip_next,
                  size: 22,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
//                    isSelected[1]?none():Navigator.pushNamed(context, homepage.id);
//                  TODO: SearchPage
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
                    "PLAYLISTS",
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
//                    isSelected[3]?none():Navigator.pushNamed(context, homepage.id);
//                  TODO:
                    },

                    child: homesidetiles2(Icons.add, "Create PlayList", isSelected[3])),
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

