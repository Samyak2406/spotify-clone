import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'constants.dart';
import 'signIn.dart';
import 'logIn.dart';

AudioPlayer _audioPlayer=AudioPlayer();
var _store=FirebaseFirestore.instance;


class homesidetiles extends StatelessWidget {
  var icon;
  var text;
  bool selected;

  homesidetiles(this.icon, this.text,this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: selected? Color(0xff282828): Colors.white.withOpacity(0),
        borderRadius: BorderRadius.circular(5),
      ),
      child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 0.8,
        child: Row(
          children: [
            Icon(
              icon,
              color: selected?Colors.white:Colors.grey,
              size: 30,
            ),
            Flexible(
              child: Text(
                "   " + text,
                style: selected?selectedSidebar:sidebar,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class homesidetiles2 extends StatelessWidget {
  var icon;
  var text;
  bool selected;

  homesidetiles2(this.icon, this.text,this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: selected?  Color(0xff282828): Colors.white.withOpacity(0),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 40,
      width: double.infinity,
      child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 0.8,
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: icon == LineIcons.heart ? Colors.blue : Colors.grey,
              child: Icon(
                icon,
                color:
                    icon == LineIcons.heart ? Colors.grey.shade200 : Colors.black,
                size: 20,
              ),
            ),
            Flexible(
              child: Text(
                "   " + text,
                style: sidebar,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class appBar extends StatefulWidget {
  var opacity;
  appBar(this.opacity);

  @override
  _appBarState createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    setState((){
//      print("In init");
      print(Cauth);
//      Cauth;
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      color: Colors.red.withOpacity(widget.opacity),
      height: AppBar().preferredSize.height,
      width: double.infinity,
      child: FractionallySizedBox(
        heightFactor: 0.6,
        widthFactor: 0.95,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    LineIcons.angle_left,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    LineIcons.angle_right,
                    color: Colors.grey,
                  ),
                ],
              ),
              Cauth?Text(userEmail,style: sign,):Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, signIn.id);
                    },
                    child: Text(
                      "SIGN UP",
                      style: sign,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, logIn.id);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 35,right: 35),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                      ),
                      child: Center(
                        child: Text(
                          "LOG IN",
                          style: log,
                        ),
                      ),
                    ),
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

class songcard extends StatefulWidget {
  String imagepath, title, subtitle;
  int i;

  songcard(this.i,this.imagepath, this.title, this.subtitle);

  @override
  _songcardState createState() => _songcardState();
}

class _songcardState extends State<songcard> {
  double ops=0;

  Color defColor=Color(0xff171717);
  bool spy=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
//        print("here");
        try{
          _store.collection(userEmail).doc(widget.i.toString()).update(
              {
                "liked": 1,
              }
          );
        }catch(e){
//          print(e);
        }
      },
      child: Container(
        child: MouseRegion(
          onExit: (_){
            setState(() {
              defColor=Color(0xff171717);
              spy=false;
//            print("Out");
            });
          },
          onEnter: (_){
//          print("in");
            setState(() {
              defColor=Color(0xff272727);
              spy=true;
            });
          },
          child: Center(
            child: FractionallySizedBox(
              heightFactor: 0.9,
              widthFactor: 0.8,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight / 1.7,
                            width: constraints.maxWidth,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(widget.imagepath),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 400),
                            child: GestureDetector(
                              onTap: (){
                                _audioPlayer.play(
                                    "songs/lovely.mp3"
                                );
                              },
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: !spy?Colors.white.withOpacity(0):Colors.green.withOpacity(1),
                                ),
                                duration: Duration(milliseconds: 350),
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: spy? Colors.white.withOpacity(1):Colors.white.withOpacity(0),
                                ),

                              ),
                            ),
                            bottom: spy?15:10,
                            right: 10,
                          )
                        ],
                      ),
                      Flexible(
                        child: Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: cardtitle,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.subtitle,
                          overflow: TextOverflow.ellipsis,
                          style: cardsubtitle,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: defColor,
        ),
      ),
    );
  }
}