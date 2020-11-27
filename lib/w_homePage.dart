import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:hovering/hovering.dart';
import 'constants.dart';

AudioPlayer _audioPlayer=AudioPlayer();



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

class appBar extends StatelessWidget {
  var opacity;
  appBar(this.opacity);
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      color: Colors.red.withOpacity(opacity),
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
              Row(
                children: [
                  Text(
                    "SIGN UP",
                    style: sign,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
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

  songcard(this.imagepath, this.title, this.subtitle);

  @override
  _songcardState createState() => _songcardState();
}

class _songcardState extends State<songcard> {
  double ops=0;

  @override
  Widget build(BuildContext context) {
    Color defColor=Color(0xff171717);
    return Container(
      child: MouseRegion(
        onExit: (_){
          setState(() {
            defColor=Color(0xff171717);
          });
        },
        onEnter: (_){
          print("in");
          setState(() {
            defColor=Color(0xff272727);
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
                        Positioned(
                          child: GestureDetector(
                            onTap: (){
                              _audioPlayer.play(
                                  "songs/lovely.mp3"
                              );
                            },
                            child: HoverContainer(
                              hoverDecoration: BoxDecoration(
                                color: Color(0xff1DB954),
                                shape: BoxShape.circle,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0x001DB954),
                                shape: BoxShape.circle,
                              ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 3000),
                                height: 50,
                                width: 50,
                                child: MouseRegion(
                                  onEnter: (_){
                                    setState(() {
                                      ops=1;
                                    });
                                  },
                                  onExit: (_){
                                    setState(() {
                                      ops=0;
                                    });
                                  },
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white.withOpacity(ops),
                                  ),
                                ),

                              ),
                            ),
                          ),
                          bottom: 10,
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
        borderRadius: BorderRadius.circular(10),
        color: defColor,
      ),
    );
  }
}