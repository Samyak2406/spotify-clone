import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/homepage.dart';
import 'package:spotify/widgets.dart';
import 'constants.dart';

class mylibrary extends StatelessWidget {

//  TODO: In initstate define count and get list likedItems

  var count = 0;
  var likedItems = [1,2,5];

  static const id = "mylibrary";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>true,
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Stack(
          children: [
            Row(
              children: [
                no1(
                    [false, false, true, false, false]
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(top:28.0,left: 40),
                    child: ListView(
                      children: [
                        Text(
                          "Playlists",
                          style: TextStyle(
//                decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Wrap(
                          spacing: 10,
                          alignment: WrapAlignment.start,
                          runSpacing: 20,
                          children: [
                            LikedBox(count),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            playBar(),
          ],
        ),
      ),
    );
  }
}


class LikedBox extends StatefulWidget {
  int count;
  LikedBox(this.count);

  @override
  _LikedBoxState createState() => _LikedBoxState();
}

class _LikedBoxState extends State<LikedBox> {
  var hvr=false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_){
        setState(() {
          hvr=true;
        });
      },
      onExit: (_){
        setState(() {
          hvr=false;
        });
      },
      child: Stack(
        children: [
          Container(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(),),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          "Liked Songs",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      FittedBox(
                        child: Text(
                          "${widget.count} liked songs",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            height: 300,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.35,1],
                  colors: [
                    Color(0xff460BF5),
                    Colors.grey.shade400,
                  ]),
            ),
            padding: EdgeInsets.only(
                left: 25,
                bottom: 10
            ),
          ),
          AnimatedPositioned(
            right: 20,
            duration: Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            bottom: hvr?20:-4,
            child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: !hvr?Colors.white.withOpacity(0):Colors.green.withOpacity(1),
              ),
              duration: Duration(milliseconds: 350),
              height: 60,
              width: 60,
              child: Icon(
                Icons.play_arrow,
                color: hvr? Colors.white.withOpacity(1):Colors.white.withOpacity(0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
