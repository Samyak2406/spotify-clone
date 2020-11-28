import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:line_icons/line_icons.dart';
import 'w_homePage.dart';
import 'package:audioplayers/audioplayers.dart';


class homepage extends StatefulWidget {
  static const id = "homepage";

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  ScrollController _scrollController;
  var swipeUpOpacity = 0.001;
  AudioPlayer _audioPlayer=AudioPlayer();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
//       initialScrollOffset: 0,
        );
    _scrollController.addListener(scrollFader);
  }

  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
    _audioPlayer.dispose();
  }

  List<bool> isSelected = [true, false, false, false, false];

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

  int gridcount = 2;

  int gridCounter(context) {
    var width = MediaQuery.of(context).size.width;
    if (width >= 1100) {
      setState(() {
        gridcount = 5;
      });
    } else if (width < 1100 && width >= 800) {
      setState(() {
        gridcount = 4;
      });
    } else if (width < 800 && width > 650) {
      setState(() {
        gridcount = 3;
      });
    } else {
      setState(() {
        gridcount = 2;
      });
    }
    return gridcount;
  }

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
    return Scaffold(
//      floatingActionButton: FloatingActionButton(
//        onPressed: (){
//        _audioPlayer.play(
//          "songs/lovely.mp3"
//        );
//        }
//      ),
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Row(
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
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "For Your Listening Pleasure!",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Charts",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
      ),
    );
  }
}

class no1 extends StatelessWidget {
  List<bool> isSelected;

  no1(this.isSelected);

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
                homesidetiles(Icons.home, "Home", isSelected[0]),
                homesidetiles(Icons.search, "Search", isSelected[1]),
                homesidetiles(Icons.library_add, "Library", isSelected[2]),
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
                homesidetiles2(Icons.add, "Create PlayList", isSelected[3]),
                homesidetiles2(LineIcons.heart, "Liked Songs", isSelected[4]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
