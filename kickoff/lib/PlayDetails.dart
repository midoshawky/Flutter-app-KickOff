import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'Choosepage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:stopper/stopper.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class PlayDetails extends StatefulWidget {
  const PlayDetails({Key key, this.pgName, this.pgLoc}) : super(key: key);
  @override
  _PlayDetailsState createState() => _PlayDetailsState();
  final pgName, pgLoc;
}

class _PlayDetailsState extends State<PlayDetails> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  List<Marker> markers = [];
  var H = 50.0;
  var ico1 = Icons.person;
  var ico1Color = Colors.grey;
  var ico2 = Icons.group;
  var ico2Color = Colors.grey;
  var ico3 = Icons.phone;
  var ico3Color = Colors.grey;
  var ico4 = Icons.access_time;
  var ico4Color = Colors.grey;
  var ico5 = Icons.timer_off;
  var ico5Color = Colors.grey;
  Random random;
  TimeOfDay time = TimeOfDay.now();
  String fname, tname, phone, PCode;
  String sTime = "StartTime", eTime;
  bool therewillBeStepper = false;
  @override
  void initState() {
    super.initState();

    markers.add(Marker(
        markerId: MarkerId(widget.pgName),
        position: LatLng(31.118109, 29.784298)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Builder(builder: (context) {
          return Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    primary: true,
                    expandedHeight: 400,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                      child: GoogleMap(
                        mapType: MapType.hybrid,
                        markers: Set.from(markers),
                        initialCameraPosition: CameraPosition(
                            target: LatLng(31.118109, 29.784298), zoom: 18),
                      ),
                    )),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate(<Widget>[
                    Card(
                      elevation: 6,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 600,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 12),
                              child: Text("Details ",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: 'Avant')),
                            ),
                            ListTile(
                                leading: Icon(
                                  Icons.title,
                                  color: Colors.green,
                                ),
                                title: Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    widget.pgName,
                                    style: TextStyle(fontFamily: 'Avant'),
                                  ),
                                )),
                            ListTile(
                                leading: Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                ),
                                title: Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    widget.pgLoc,
                                    style: TextStyle(fontFamily: 'Avant'),
                                  ),
                                )),
                            ListTile(
                                leading: Icon(
                                  Icons.attach_money,
                                  color: Colors.green,
                                ),
                                title: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "120 LE/Hr",
                                      style: TextStyle(fontFamily: 'Avant'),
                                    ))),
                            Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Divider(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 12),
                              child: Text("Description",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: 'Avant')),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 12),
                              child: Text(
                                  "Best PlagGround Ever With More ..... ",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontFamily: 'Avant')),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Divider(),
                            ),
                            Center(
                              child: SmoothStarRating(
                                borderColor: Colors.green,
                                color: Colors.green,
                                rating: 4,
                                size: 50,
                                starCount: 5,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Divider(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]))
                ],
              ),
              SlidingUpPanel(
                backdropEnabled: true,
                parallaxEnabled: true,
                backdropOpacity: 0.7,
                backdropTapClosesPanel: true,
                backdropColor: Colors.black,
                borderRadius: BorderRadius.circular(20),
                minHeight: H,
                panel: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            margin: EdgeInsets.all(0),
                            color: Colors.green,
                            child: InkWell(
                              child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Kick Off",
                                      style: TextStyle(
                                          fontFamily: "Avant",
                                          color: Colors.white,
                                          fontSize: 19),
                                    ),
                                  )),
                              splashColor: Colors.white,
                              onTap: () {
                                setState(() {
                                  this.H = 500;
                                });
                              },
                            )),
                        Form(
                            key: key,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 9, top: 15),
                                  child: Text("First Name :",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: "Avant")),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Stack(
                                        children: <Widget>[
                                          IconButton(
                                              icon: Icon(
                                                ico1,
                                                color: ico1Color,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 50, right: 8),
                                            child: Center(
                                              child: TextField(
                                                style: TextStyle(fontSize: 18),
                                                decoration:
                                                    InputDecoration.collapsed(
                                                  hintText: "Muhammed Shawky",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[400]),
                                                ),
                                                onChanged: (fname) {
                                                  this.fname = fname;
                                                  setState(() {
                                                    ico1 = Icons
                                                        .check_circle_outline;
                                                    ico1Color = Colors.green;
                                                  });
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 9, top: 4),
                                  child: Text("Team Name:",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: "Avant")),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Stack(
                                        children: <Widget>[
                                          IconButton(
                                              icon: Icon(
                                                ico2,
                                                color: ico2Color,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 50, right: 8),
                                            child: Center(
                                              child: TextField(
                                                style: TextStyle(fontSize: 18),
                                                decoration:
                                                    InputDecoration.collapsed(
                                                  hintText: "Dream Team",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[400]),
                                                ),
                                                onChanged: (tname) {
                                                  this.tname = tname;
                                                  setState(() {
                                                    ico2 = Icons
                                                        .check_circle_outline;
                                                    ico2Color = Colors.green;
                                                  });
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 9, top: 4),
                                  child: Text("Phone Number :",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: "Avant")),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Stack(
                                        children: <Widget>[
                                          IconButton(
                                              icon: Icon(
                                                ico3,
                                                color: ico3Color,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 50, right: 8),
                                            child: Center(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.phone,
                                                style: TextStyle(fontSize: 18),
                                                decoration:
                                                    InputDecoration.collapsed(
                                                  hintText: "01234567891",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[400]),
                                                ),
                                                onChanged: (phone) {
                                                  this.phone = phone;
                                                  setState(() {
                                                    ico3 = Icons
                                                        .check_circle_outline;
                                                    ico3Color = Colors.green;
                                                  });
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 9, top: 4),
                                  child: Text("Choose Playing Time:",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: "Avant")),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                          width: 150,
                                          height: 50,
                                          child: Stack(
                                            children: <Widget>[
                                              IconButton(
                                                  icon: Icon(
                                                    ico4,
                                                    color: ico4Color,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  }),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 50, right: 8),
                                                child: Center(
                                                    child: GestureDetector(
                                                  child: Text(
                                                    sTime == null
                                                        ? "Start Time"
                                                        : sTime,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        color:
                                                            Colors.grey[400]),
                                                  ),
                                                  onTap: () {
                                                    TimePick(context);
                                                  },
                                                )),
                                              )
                                            ],
                                          )),
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                          height: 50,
                                          width: 150,
                                          child: Stack(
                                            children: <Widget>[
                                              IconButton(
                                                  icon: Icon(
                                                    ico5,
                                                    color: ico5Color,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  }),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 50, right: 8),
                                                child: Center(
                                                  child: TextField(
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                      hintText: "End Time",
                                                      hintStyle: TextStyle(
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                    onChanged: (sTime) {
                                                      this.sTime = sTime;
                                                      setState(() {
                                                        ico5 = Icons
                                                            .check_circle_outline;
                                                        ico5Color =
                                                            Colors.green;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      width: 300,
                                      height: 40,
                                      child: RaisedButton(
                                        onPressed: () {
                                          random = Random();
                                          PCode = (100000+random.nextInt(9999999)).toString();
                                          dialog(context, PCode);
                                        },
                                        elevation: 5,
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    )),
                onPanelOpened: () {
                  setState(() {
                    this.H = 50;
                  });
                },
              )
            ],
          );
        }));
  }

  Future<Null> TimePick(BuildContext context) async {
    TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null) {
      setState(() {
        time = picked;
        sTime = time.toString().substring(10, 15);
        ico4 = Icons.check_circle_outline;
        ico4Color = Colors.green;
      });
    }
  }

  Future<void> dialog(BuildContext context,String code) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(0),
                      elevation: 5,
                      child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              color: Colors.white
                          ),
                          child: Image(
                              image: AssetImage("images/checkmarksuccess.gif"))),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Center(
                      child: Text(
                        "$fname, Thanks for Reservation the owner will call you back ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Avant",
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    child: Divider(),
                    padding: EdgeInsets.only(left: 20, right: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        "Dont Forget Your Code :",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Avant",
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Center(
                      child: Text(
                        "$code",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Avant",
                            fontSize: 40,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  Padding(
                    child: Divider(),
                    padding: EdgeInsets.only(left: 20, right: 20),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => choosePage(
                                    therewillbeStepper: false,
                                    name: fname,
                                    Code: code,
                                  )));
                    },
                    child: Text(
                      "Confirm",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.green,
          );
        });
  }
}
