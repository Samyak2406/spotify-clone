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




  int gridcount  = 2;

  int gridCounter(context){
    var width = MediaQuery.of(context).size.width;
//    print(width);
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
      print(gridcount);
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
            Expanded(
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
            ),
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
                                (index) => songcard("images/kabira.jpg","Kabira","Tochi Raina, Rekha Bhardwaj"),
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
                                6,
                                    (index) => songcard("images/kabira.jpg","Kabira","Tochi Raina, Rekha Bhardwaj"),
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

class songcard extends StatelessWidget {
  String imagepath,title,subtitle;

  songcard(
      this.imagepath,
      this.title,
      this.subtitle
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FractionallySizedBox(
          heightFactor: 0.9,
          widthFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagepath),
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: cardtitle,
                ),
              ),
              Flexible(
                child: Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: cardsubtitle,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff171717),
      ),
    );
  }
}
