import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:spotify/constants.dart';
import 'package:spotify/widgets.dart';
import 'trie.dart';
import 'widgets.dart';
import 'w_homePage.dart';

class search extends StatefulWidget {
  static const id = "search";

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {

  Map m = Map();
  List show = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < songs.length; i++) {
      String s1 = songs[i].title;
      String s2 = songs[i].subtitle;
      s1 = refine(s1);
      s2 = refine(s2);
      m[s1] = i;
      m[s2] = i;
      insert(s1);
      insert(s2);
    }
//   print(m);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Row(
          children: [
            no1([false, true, false, false, false]),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 3,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Icon(
                                    LineIcons.search,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: TextField(
                                  onChanged: (v) {
                                    if (v.length > 0) {
                                      var ls = autoSuggestion(refine(v));
                                      setState(() {
                                        show = [];
                                      });
                                      for (int i = 0; i < ls.length; i++) {
                                        setState(() {
                                          show.add(m[ls[i]]);
                                        });
//                                print(ls[i]+" "+m[ls[i]].toString());
                                      }

                                  }
                                    else{
                                      setState(() {
                                        show=[];
                                      });
                                    }
                                  },
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                              hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
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
                                      show[index],
                                      songs[show[index]].path,
                                      songs[show[index]].title,
                                      songs[show[index]].subtitle),
                                );
                              },
                              childCount: show.length,
                            ),
                          ),
                        ],
                      ),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
