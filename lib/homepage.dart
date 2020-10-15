import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:line_icons/line_icons.dart';
import 'w_homePage.dart';

class homepage extends StatefulWidget {
  static const id = "homepage";

  @override
  _homepageState createState() => _homepageState();
}



class _homepageState extends State<homepage> {

  List<songOuter> songs =[
    songOuter("images/kabira.jpg","Kabira","Tochi Raina, Rekha Bhardwaj"),
    songOuter("images/bekhayali.jpg","Kabir Singh","Sachet Tandon"),
    songOuter("images/humnava mere.jpg","Album Song","Rocky-Shiv"),
    songOuter("images/dil bechara.jpg","Dil Bechara","A. R. Rahman"),
    songOuter("images/filhall.jpg","Filhall","B Praak"),
    songOuter("images/pachtaoge.jpg","Pachataoge","Arijit Singh"),
    songOuter("images/sun raha hai.jpg","Aashiqui 2","Ankit Tiwari"),
    songOuter("images/thodi jagah.jpg","Marjaavaan","Arijit Singh"),
    songOuter("images/valam.jpg","Made in Chaina","Priya Saraiya, Sachin–Jigar, Arijit Singh"),
    songOuter("images/khairiyat.jpg","Chhichhore","Arijit Singh"),
  ];

  int gridcount  = 2;

  int gridCounter(context){
    var width = MediaQuery.of(context).size.width;
    if(width>=1100){
      setState(() {
        gridcount=5;
      });
    }
  else if(width<1100 && width>=800 ){
    setState(() {
      gridcount=4;
    });
    }
  else if(width<800 && width>650){
    setState(() {
      gridcount=3;
    });
    }
    else{
      setState(() {
        gridcount=2;
      });
    }
    return gridcount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Row(
          children: [
            no1(),
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
                        child: ListView(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "For Your Listening Pleasure!",
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
                              height: 60,
                              width: double.infinity,
                            ),
                            SizedBox(height: 15,),
                            GridView.count(
                              childAspectRatio: 0.7,
                              shrinkWrap: true,
                              crossAxisCount: gridCounter(
                                context
                              ),
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              children: List.generate(
                                6,
                                (index) => songcard(songs[index].path,songs[index].title,songs[index].subtitle),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Row(
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
                              height: 60,
                              width: double.infinity,
                            ),
                            SizedBox(height: 15,),
                            GridView.count(
                              childAspectRatio: 0.7,
                              shrinkWrap: true,
                              crossAxisCount: gridcount,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              children: List.generate(
                                10,
                                    (index) => songcard(songs[index].path,songs[index].title,songs[index].subtitle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  appBar(),
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: leftbar,
        child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 0.8,
          child: Center(
            child: ListView(
              children: [
                Container(
                  height: AppBar().preferredSize.height * 1.4,
                  alignment: Alignment.bottomLeft,
                  child: FractionallySizedBox(
                    heightFactor: 0.85,
                    widthFactor: 0.8,
                    child: Image.asset("images/logo.png"),
                  ),
                ),
                homesidetiles(Icons.home,"Home"),
                homesidetiles(Icons.search,"Search"),
                homesidetiles(Icons.library_add,"Library"),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "PLAYLISTS",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                homesidetiles2(Icons.add,"Createt PlayList"),
                homesidetiles2(LineIcons.heart,"Liked Songs"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
