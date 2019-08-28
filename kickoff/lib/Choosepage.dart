import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'PlayDetails.dart';

class choosePage extends StatefulWidget {
  const choosePage({Key key, this.therewillbeStepper, this.Code, this.name})
      : super(key: key);
  @override
  _choosePageState createState() => _choosePageState();
  final bool therewillbeStepper;
  final String Code, name;
}

class _choosePageState extends State<choosePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  CarouselSlider slider;
  CarouselSlider BodyPages;
  int count = 0;
  int sel=1;
  var icon;
  bool Boolpref = null;
  Widget mainBody;
  List<dynamic> favourtie= ["open"];
  List<String> Names = [
    "Wimply",
    "Pharos",
    "Remontada",
    "Hercuils",
    "Elephant"
  ];
  List<String> Location = [
    "ELBitash",
    "Hanovile",
    "Smouha",
    "SidiBishr",
    "Sporting"
  ];
  List<String> Availible = ["open", "open", "closed", "closed", "open"];
  @override
  void initState() {
    super.initState();
    icon = IconButton(
        icon: Icon(
          Icons.navigate_next,
          color: Colors.green,
          size: 40,
        ),
        onPressed: () {
          slider.nextPage(
              duration: Duration(milliseconds: 100),
              curve: Curves.fastOutSlowIn);
        });
    Boolpref = widget.therewillbeStepper;
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  Widget build(BuildContext context) {
    slider = CarouselSlider(
      onPageChanged: (i) {
        if (i == 3) {
          setState(() {
            icon = IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    Boolpref = true;
                  });
                  //this.setPref(!this.Boolpref);
                });
          });
        } else {
          setState(() {
            icon = IconButton(
                icon: Icon(
                  Icons.navigate_next,
                  color: Colors.green,
                  size: 40,
                ),
                onPressed: () {
                  slider.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.fastOutSlowIn);
                });
          });
        }
      },
      enableInfiniteScroll: false,
      aspectRatio: 16 / 9,
      reverse: false,
      height: MediaQuery.of(context).size.height,
      items: [
        [
          "images/kickoff.png",
          "Hey first time !!",
          "now will show you \n how to use the app as a player .."
        ],
        [
          "images/location.png",
          "Get your Location",
          " Using the maps to see \nthe playgrounds which around you"
        ],
        [
          "images/search.png",
          "Search And Choose",
          " Search for the suited playground \nchoose it within thousands of other playgrounds near to you"
        ],
        [
          "images/forma.png",
          "Register and Fill up",
          " Fill up the form of registeration \nand save the code of the reservation\nand thats it wait for the response"
        ]
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        i[0],
                        width: 130,
                        height: 130,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: Text(
                          i[1],
                          style: TextStyle(
                              fontFamily: 'TheBold',
                              fontSize: 20,
                              color: Colors.green),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        i[2],
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ));
          },
        );
      }).toList(),
    );
    BodyPages = CarouselSlider(
      initialPage: 0,
      enableInfiniteScroll: false,
      viewportFraction: 1.0,
      height: MediaQuery.of(context).size.height,
      //height: MediaQuery.of(context).size.height,
      items: [home(), main(), about()].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: i);
          },
        );
      }).toList(),
    );
    if (Boolpref == null) {
      mainBody = Stack(
        children: <Widget>[
          slider,
          Positioned(
            child: icon,
            left: 50,
            right: 50,
            bottom: 9,
          ),
          Positioned(
            child: InkWell(
              child: Text(
                "SKIP",
                style: TextStyle(fontFamily: 'TheBold'),
              ),
              splashColor: Colors.white,
              onTap: () {
                setState(() {
                  Boolpref = true;
                });
              },
            ),
            left: 30,
            top: 40,
          ),
        ],
      );
    } else {
      mainBody = body();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: mainBody,
    );
  }

  Widget body() {
    return Scaffold(
        body: BodyPages,
        backgroundColor: Colors.white,
        bottomNavigationBar: FancyBottomNavigation(
          circleColor: Colors.green,
          inactiveIconColor: Colors.green,
          initialSelection: sel,
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.favorite, title: "Favourtie")
          ],
          onTabChangedListener: (position) {
            setState(() {
              BodyPages.animateToPage(position,
                  curve: Curves.fastOutSlowIn, duration: Duration(seconds: 1));
            });
          },
        ));
  }

  Widget main() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          ListView.builder(
              itemCount: Names.length,
              itemBuilder: (context, index) {
                return ListElements(
                    Names[index], Location[index], Availible[index], index);
              }),
          Positioned(
              top: 40,
              right: 11,
              left: 11,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 6,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        Padding(
                          padding: EdgeInsets.only(left: 50, right: 8),
                          child: Center(
                            child: TextField(
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration.collapsed(
                                hintText: "Search Here ...",
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              )),
        ],
      ),
      color: Colors.white,
    );
  }

  Widget home() {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Stack(children: [
        Container(
          color: Colors.white,
          width: Width,
          height: Height,
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200))),
          margin: EdgeInsets.only(top: 0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200))),
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Text(
                    "${widget.Code == null ? "N/A" : "${widget.Code}"}",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 50,
                        fontFamily: "Avant"),
                  ),
                ],
              )),
          elevation: 9,
        ),
      ]),
    );
  }

  Widget about() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: favourtie.length,
            itemBuilder: (context, positon) {
          return ListTile(
            title: Text(favourtie[positon]),
          );
        }));
  }

  Widget ListElements(pName, loc, avlbl, indx) {
    Color opened;
    if (avlbl == "open")
      opened = Colors.green;
    else
      opened = Colors.grey;
    return Card(
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "images/two.jpg",
                ))),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 5,
                left: 8,
                child: CircleAvatar(
                  backgroundColor: opened,
                  radius: 12,
                )),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      color: Colors.green,
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8, top: 7),
                            child: Text(
                              pName,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              loc,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              splashColor: Colors.green,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayDetails(
                            pgName: Names[indx], pgLoc: Location[indx])));
              },
              onLongPress: () {
                favourtie.add(Names[indx]);
                setState(() {
                  BodyPages.animateToPage(2,curve: Curves.fastOutSlowIn,duration: Duration(seconds: 1));
                  sel=2;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
