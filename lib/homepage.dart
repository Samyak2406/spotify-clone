import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:line_icons/line_icons.dart';

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
                    child: Column(
                      children: [
                       Container(
                         height: AppBar().preferredSize.height*1.4,
                         alignment: Alignment.bottomLeft,
                         child: FractionallySizedBox(
                           heightFactor: 0.85,
                           widthFactor: 0.8,
                           child: Image.asset("images/logo.png"),),
                       ),
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
                        offset: Offset(0,AppBar().preferredSize.height),
                        child: ListView(

                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              height: 60,
                              width: double.infinity,
//                              color: Colors.orange,
                            ),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              children:
                              List.generate(
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

class appBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: topbar,
      height: AppBar().preferredSize.height,
      width: double.infinity,
      child: FractionallySizedBox(
        heightFactor: 0.8,
        widthFactor: 0.95,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    LineIcons.angle_left,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    LineIcons.angle_right,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "SIGN UP",
                    style: log,
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "LOG IN",
                    style: log,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
