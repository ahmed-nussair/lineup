import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lineup/ui/credentials/forgot_your_password.dart';

import '../main/home.dart';
import '../screen_util.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {

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

                // the sign up label
                Container(
                  alignment: Alignment.center,
                  height: screenUtil.setHeight(200),
                  width: screenUtil.setWidth(600),
                  child: Text('Don\'t have an account?',
                    style: TextStyle(
                      fontSize: screenUtil.setSp(50),
                      //decoration: TextDecoration.underline,
                    ),

                  ),
                ),

                // the sign up button
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUp()));
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
                          child: Text('Sign Up',
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

          // the login form
          Positioned(
            top: 0.0,
            right: screenUtil.setWidth((MediaQuery.of(context).size.width / 10).round()),
            left: screenUtil.setWidth((MediaQuery.of(context).size.width / 10).round()),
            child: Form(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[

                  // spacing
                  Padding(
                    padding: EdgeInsets.all(screenUtil.setHeight(50)),
                  ),

                  // the logo
                  Container(
                    alignment: Alignment.center,
                    child: Text('LOGO is here',
                      style: TextStyle(
                        fontSize: screenUtil.setSp(80),
                        color: Color(0xffFC550A),
                      ),
                    ),
                  ),

                  // spacing
                  Padding(
                    padding: EdgeInsets.all(screenUtil.setHeight(30)),
                  ),

                  // the title
                  Container(
                    alignment: Alignment.center,
                    child: Text('LOGIN',
                      style: TextStyle(
                        fontSize: screenUtil.setSp(60),
                        color: Color(0xffFC550A),
                      ),
                    ),
                  ),

                  // spacing
                  Padding(
                    padding: EdgeInsets.all(screenUtil.setHeight(100)),
                  ),

                  // the email field
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
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: screenUtil.setSp(40),
                        ),
                        contentPadding: EdgeInsets.all(screenUtil.setWidth(50)),
                    ),
                  ),

                  // spacing
                  Padding(
                    padding: EdgeInsets.all(screenUtil.setWidth(20)),
                  ),

                  // the password field
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: _outlineInputBorder,
                        enabledBorder: _outlineInputBorder,
                        errorBorder: _outlineInputBorder,
                        disabledBorder: _outlineInputBorder,
                        border: _outlineInputBorder,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: screenUtil.setSp(40),
                        ),
                        contentPadding: EdgeInsets.all(screenUtil.setWidth(50)),
                    ),
                  ),

                  // forgot password
                  Padding(
                    padding: EdgeInsets.all(screenUtil.setWidth(30)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ForgotYourPassword()));
                      },
                      child: Text('Forgot your password?',
                        style: TextStyle(
                          fontSize: screenUtil.setSp(40),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  // spacing
                  Padding(
                    padding: EdgeInsets.all(screenUtil.setWidth(20)),
                  ),

                  // sign in button
                  Padding(
                    padding: EdgeInsets.only(left: screenUtil.setWidth(550)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: screenUtil.setHeight(150),
                        width: screenUtil.setWidth(300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(80.0),),
                          color: Color(0xffFC550A),
                        ),
                        child: Text('Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenUtil.setSp(50),
                          ),
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
