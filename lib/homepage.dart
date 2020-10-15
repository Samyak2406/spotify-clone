import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:line_icons/line_icons.dart';
import 'w_homePage.dart';

class homepage extends StatelessWidget {
  static const id = "homepage";
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
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              children: List.generate(
                                40,
                                (index) => Container(
                                  color: Colors.teal,
                                ),
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
