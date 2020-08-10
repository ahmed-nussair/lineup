import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen_util.dart';
import 'login.dart';
import 'signup.dart';

class ForgotYourPassword extends StatefulWidget {
  @override
  _ForgotYourPasswordState createState() => _ForgotYourPasswordState();
}

class _ForgotYourPasswordState extends State<ForgotYourPassword> with TickerProviderStateMixin {

  final screenUtil = ScreenUtil(
    allowFontScaling: true,
  );

  OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
    borderSide: BorderSide(
      color: Colors.transparent
    ),
  );

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[

          // the background
          Image.asset('assets/login_background.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),

          // the footer
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                // the sign in label
                Container(
                  alignment: Alignment.centerLeft,
                  height: screenUtil.setHeight(200),
                  width: screenUtil.setWidth(500),
                  child: Text('Remembered Your Password?',
                    style: TextStyle(
                      fontSize: screenUtil.setSp(45),
                      decoration: TextDecoration.underline,
                    ),

                  ),
                ),

                // the sign in button
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(screenUtil.setWidth(150)),
                      ),
                      color: Color(0xffFC550A),
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
                            color: Color(0xffFC550A),
                          ),
                          child: Text('Login',
                            style: TextStyle(
                              color: Colors.white,
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

              ],
            ),
          ),

          // the form
          Positioned(
            top: 0.0,
            right: screenUtil.setWidth((MediaQuery.of(context).size.width / 10).round()),
            left: screenUtil.setWidth((MediaQuery.of(context).size.width / 10).round()),
            child: Form(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(screenUtil.setHeight(50)),
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
                  Padding(
                    padding: EdgeInsets.all(screenUtil.setHeight(30)),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Text('Forgot Your Password?',
                      style: TextStyle(
                        fontSize: screenUtil.setSp(60),
                        color: Color(0xffFC550A),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(screenUtil.setHeight(100)),
                  ),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: _outlineInputBorder,
                        enabledBorder: _outlineInputBorder,
                        errorBorder: _outlineInputBorder,
                        disabledBorder: _outlineInputBorder,
                        border: _outlineInputBorder,
                        hintText: 'Your Email',
                        hintStyle: TextStyle(
                          fontSize: screenUtil.setSp(40),
                        ),
                        contentPadding: EdgeInsets.all(screenUtil.setWidth(50)),
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.all(screenUtil.setWidth(20)),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: screenUtil.setWidth(550)),
                    child: Container(
                      alignment: Alignment.center,
                      height: screenUtil.setHeight(150),
                      width: screenUtil.setWidth(300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(80.0),),
                        color: Color(0xffFC550A),
                      ),
                      child: Text('Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenUtil.setSp(50),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
