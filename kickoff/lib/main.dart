import 'package:flutter/material.dart';
import 'Choosepage.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green
      ),
      home: StartUp(),
      title: "Kick Off",
      debugShowCheckedModeBanner: false,
      color: Colors.green,
    );
  }
}

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> with TickerProviderStateMixin {
  AnimationController animationController, animationController2;
  Animation animation, animation2;
  final GlobalKey<ScaffoldState> ScaffKey = GlobalKey<ScaffoldState>();
  var opac = 1.0;
  var opac2 = 0.0;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    animationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 7));
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animation2 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn)));
    animationController.forward();
    animationController2.forward();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        opac = 0;
        opac2 = 1;
      });
    });
    Future.delayed(Duration(seconds: 7), () {
      setState(() {
        opac2 = 1;
      });
    });
  }

  Widget body() {
    return Container(
        color: Colors.transparent,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  opacity: opac2,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      "images/a7gz.png",
                      width: 200,
                      height: 200,
                    ),
                  )),
              Text(
                "WELCOME !!",
                style: TextStyle(
                    color: Colors.green, fontSize: 50.0, fontFamily: 'TheBold'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Choose how to use the app ..",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                      fontFamily: 'TheBold'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                      child: InkWell(
                    child: Image.asset(
                      "images/kickoff.png",
                      height: 150,
                      width: 150,
                    ),
                    splashColor: Colors.green,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> choosePage()));
                    },
                    onLongPress: () {
                      var SnakBar = SnackBar(
                        content: Text(
                            "press on this if u want to reserve a playground"),
                        duration: Duration(seconds: 4),
                        backgroundColor: Colors.green,
                      );
                      ScaffKey.currentState.showSnackBar(SnakBar);
                    },
                  )),
                  Card(
                      child: InkWell(
                    child: Image.asset(
                      "images/admintwo.png",
                      height: 150,
                      width: 150,
                    ),
                    splashColor: Colors.green,
                    onTap: () {},
                    onLongPress: () {
                      var SnakBar = SnackBar(
                        content: Text(
                            "press on this if you are the host of the playground"),
                        duration: Duration(seconds: 4),
                        backgroundColor: Colors.green,
                      );
                      ScaffKey.currentState.showSnackBar(SnakBar);
                    },
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Padding(padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                 child:  Text(
                   "User",
                   style: TextStyle(
                       color: Colors.black87, fontSize: 25.0,
                       fontFamily: 'TheBold'),
                 ),),
                  Padding(
                    padding: EdgeInsets.only(right: 50,left: 50,top: 5),
                    child: Text(
                      "Host",
                      style: TextStyle(
                          color: Colors.black87, fontSize: 25.0,
                          fontFamily: 'TheBold'),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double high = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              key: ScaffKey,
              backgroundColor: Colors.white,
              body: Center(
                child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, animation.value * high, 0.0),
                  child: Center(
                      child: Stack(
                    children: <Widget>[
                      AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        opacity: opac,
                        child: Image.asset("images/a7gz.png"),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                            0.0, animation2.value * high, 0.0),
                        child: body(),
                      )
                    ],
                  )),
                ),
              ));
        });
  }
}
