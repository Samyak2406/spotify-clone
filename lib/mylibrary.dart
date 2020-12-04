import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/homepage.dart';
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
        body: Row(
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
                      alignment: WrapAlignment.start  ,
                      runSpacing: 20,
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
                                    FittedBox(
                                      child: Text(
                                          "$count liked songs",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 20,
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
