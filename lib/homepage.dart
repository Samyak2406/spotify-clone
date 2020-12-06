import 'package:flutter/material.dart';
import 'package:spotify/widgets.dart';
import 'constants.dart';
import 'w_homePage.dart';
import 'package:audioplayers/audioplayers.dart';

class homepage extends StatefulWidget {
  static const id = "homepage";

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  ScrollController _scrollController;
  var swipeUpOpacity = 0.0001;
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
//       initialScrollOffset: 0,
        );
    _scrollController.addListener(scrollFader);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _audioPlayer.dispose();
  }

  List<bool> isSelected = [true, false, false, false, false];

  int gridcount = 2;

  void scrollFader() {
    setState(() {
      if (_scrollController.offset > 60) {
        swipeUpOpacity = 1;
      } else {
        swipeUpOpacity = (_scrollController.offset) / 60;
      }
//      print(swipeUpOpacity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SafeArea(
          child: Stack(
            children: [
              Row(
                children: [
                  no1(isSelected),
                  Expanded(
                    flex: 6,
                    child: Stack(
                      children: [
                        Center(
                          child: FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: 0.95,
                            child: Transform.translate(
                              offset: Offset(0, AppBar().preferredSize.height),
                              child: CustomScrollView(
                                physics: BouncingScrollPhysics(),
                                controller: _scrollController,
                                slivers: [
                                  SliverList(
                                    delegate: SliverChildListDelegate([
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "For Your Listening Pleasure!",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "SEE ALL",
                                              style: TextStyle(
                                                letterSpacing: 1.5,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SliverGrid(
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 205.0,
                                      mainAxisSpacing: 20.0,
                                      crossAxisSpacing: 20.0,
                                      childAspectRatio: 0.7,
                                    ),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        return Container(
                                          alignment: Alignment.center,
                                          child: songcard(
                                              index,
                                              songs[index].path,
                                              songs[index].title,
                                              songs[index].subtitle),
                                        );
                                      },
                                      childCount: songs.length,
                                    ),
                                  ),
                                  SliverList(
                                    delegate: SliverChildListDelegate([
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Charts",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "SEE ALL",
                                            style: TextStyle(
                                              letterSpacing: 1.5,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                  SliverGrid(
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 205.0,
                                      mainAxisSpacing: 20.0,
                                      crossAxisSpacing: 20.0,
                                      childAspectRatio: 0.7,
                                    ),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        return Container(
                                          alignment: Alignment.center,
                                          child: songcard(
                                              index,
                                              songs[index].path,
                                              songs[index].title,
                                              songs[index].subtitle),
                                        );
                                      },
                                      childCount: songs.length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        appBar(swipeUpOpacity),
                      ],
                    ),
                  ),
                ],
              ),
              playBar(),
            ],
          ),
        ),
      ),
    );
  }
}
