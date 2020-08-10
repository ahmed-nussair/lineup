import 'package:flutter/material.dart';

import 'credentials/login.dart';
import 'screen_util.dart';
import '../globals.dart' as globals;

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {

  bool _pressed;

  final screenUtil = ScreenUtil(
    allowFontScaling: true,
  );

  @override
  void initState() {
    _pressed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    screenUtil.init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[

          // the background
          Opacity(
            opacity: 0.5,
            child: Image.asset('assets/splash.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),


          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
              },
              onTapDown: (details) {
                setState(() {
                  _pressed = true;
                });
              },

              onTapUp: (details) {
                setState(() {
                  _pressed = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_height > globals.thresholdHeight? 100.0:50.0),
                  ),
                  color: _pressed?Color(0xffC93E00):Color(0xffFC550A),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: screenUtil.setHeight(200),
                      width: screenUtil.setWidth(500),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                        ),
                        color: _pressed?Color(0xffC93E00):Color(0xffFC550A),
                      ),
                      child: Text('Get Started',
                        style: TextStyle(
                          color: _pressed?Colors.grey:Colors.white,
                          fontSize: screenUtil.setSp(60),
                        ),
                      ),
                    ),
                    Container(
                      width: screenUtil.setWidth(500),
                      height: screenUtil.setHeight(0),
                      color: Color(0xffFC550A),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: screenUtil.setWidth((MediaQuery.of(context).size.width / 10).round()),
            left: screenUtil.setWidth((MediaQuery.of(context).size.width / 10).round()),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(screenUtil.setHeight(100)),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text('LOGO is here',
                    style: TextStyle(
                      fontSize: screenUtil.setSp(80),
                      color: Color(0xffFC550A),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
