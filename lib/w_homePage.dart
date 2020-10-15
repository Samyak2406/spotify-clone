import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'constants.dart';

class homesidetiles extends StatelessWidget {
  var icon;
  var text;

  homesidetiles(this.icon,this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 30,
          ),
          Flexible(
            child: Text(
              "   "+text,
              style: sidebar,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class homesidetiles2 extends StatelessWidget {
  var icon;
  var text;

  homesidetiles2(this.icon,this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            color: icon==LineIcons.heart ? Colors.blue:Colors.grey,
            child: Icon(
              icon,
              color:  icon==LineIcons.heart ? Colors.grey.shade200:Colors.black,
              size: 20,
            ),
          ),
          Flexible(
            child: Text(
              "   "+text,
              style: sidebar,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
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
                    style: log,
                  ),
                  SizedBox(
                    width: 15,
                  ),
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
