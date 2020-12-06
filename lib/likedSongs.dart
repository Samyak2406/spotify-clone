import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:spotify/constants.dart';
import 'package:spotify/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _store = FirebaseFirestore.instance;

class likedSongs extends StatefulWidget {
  static const id = "likedSongs";

  @override
  _likedSongsState createState() => _likedSongsState();
}

class _likedSongsState extends State<likedSongs> {
//  var likes = [1, 2, 3, 4];
  List<int> likes = [];

  @override
  void initState() {
    super.initState();
    getLikes();
  }

  void getLikes() async {
    for (int i = 0; i < songs.length; i++) {
      try {
        var doc =
            _store.collection(userEmail).doc(i.toString()).get().then((v) {
          if (v.data().containsValue(1)) {
            setState(() {
              likes.add(i);
//              print(i);
            });
          }
//          print(v);
//          print(v.data());
//        print(v.data().keys);
        });
      } catch (e) {}
//      finally{
//        setState(() {
//          print(likes);
//        });
//      }
    }
  }

  List<TableRow> songTile(likes) {
    List<TableRow> temp = [];
    for (int i = 0; i < likes.length; i++) {
      temp.add(fakeEntry());
      temp.add(likeCard(likes[i]));
    }
    return temp;
  }

  TableRow fakeEntry() {
    return TableRow(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  TableRow likeCard(i) {
    return TableRow(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
//            Text(
//              "",
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 16,
//                fontWeight: FontWeight.w300,
//              ),
//            ),
//            hseparators(),
            SizedBox(
              height: 30,
              width: 30,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(songs[i].path),
              ),
            ),
            hseparators(),
            Expanded(
              child: Text(
                songs[i].title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songs[i].subtitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
          child: Container(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  try {
//                    _store.collection(userEmail).add({
//                      "liked": 5,
//                    });
                  _store.collection(userEmail).doc(i.toString()).update(
                    {
                      "liked": -1,
                    }
                  );
                    likes.remove(i);
                  } catch (e) {
//                    print(e);
                  }
                });
              },
              child: Icon(
                LineIcons.heart,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Stack(
          children: [
            Row(
              children: [
                no1([false, false, false, false, true]),
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      stops: [0.3, 0.9],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff5038A0),
                        Color(0xff121212),
                      ],
                    )),
                    child: ListView(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 50, left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 7,
                                        spreadRadius: 3,
                                        offset: Offset(
                                          -6,
                                          -5,
                                        )),
                                  ],
                                ),
                                height: MediaQuery.of(context).size.height / 3,
                                child: Image.asset("images/like1.png"),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Liked Songs",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 80,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "" + userEmail,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 800,
                          padding:
                              EdgeInsets.only(top: 50, left: 30, right: 30),
                          color: Colors.black54.withOpacity(0.3),
                          child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(5),
                              1: FlexColumnWidth(2),
                            },
                            children: [
                                  TableRow(
                                    children: [
                                      Text(
                                        "#TITLE",
                                        style: tableTitle,
                                      ),
                                      Text(
                                        "ARTISTS",
                                        style: tableTitle,
                                      ),
                                      Text(
                                        "LIKE",
                                        style: tableTitle,
                                      ),
                                    ],
                                  )
                                ] +
                                songTile(likes),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
