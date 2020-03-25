import 'dart:async';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {

    SplashScreen( {Key key, this.title}) : super(key: key);

    final String title;

    @override
    _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{

    @override
    void initState() {
        super.initState();
        startTime();
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            body: new Center(
                child: new Image.asset('assets/images/logo.jpg'),
            ),
        );
    }

  @override
  void startTime() async {
      setState(() {
          var _duration = new Duration(seconds: 2);
          Timer(_duration, navigationPage);
      });
  }
    void navigationPage() {
        Navigator.of(context).pushReplacementNamed('/login');
//        Navigator.push(context, new MaterialPageRoute(
//            //builder: (BuildContext context) => new GridViewDemo(),
//        ));
    }
}