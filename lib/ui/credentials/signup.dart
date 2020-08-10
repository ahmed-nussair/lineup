import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:lineup/ui/credentials/login.dart';

import '../screen_util.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {

  final screenUtil = ScreenUtil(
    allowFontScaling: true,
  );

  String _countryCode;

  OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
    borderSide: BorderSide(
        color: Colors.transparent
    ),
  );

  MaskedTextController _phoneController = MaskedTextController(mask: '000 000 0000');

  @override
  void initState() {
    super.initState();
    _countryCode = '+966';
  }
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

          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: <Widget>[
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

                Padding(
                  padding: EdgeInsets.all(screenUtil.setHeight(30)),
                ),

//                // the title
//                Container(
//                  alignment: Alignment.center,
//                  child: Text('Registration',
//                    style: TextStyle(
//                      fontSize: screenUtil.setSp(60),
//                      color: Color(0xffFC550A),
//                    ),
//                  ),
//                ),

//                Padding(
//                  padding: EdgeInsets.all(screenUtil.setHeight(20)),
//                ),

                Form(
                  child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: screenUtil.setWidth((MediaQuery.of(context).size.width / 10).round()),
                        left: screenUtil.setWidth((MediaQuery.of(context).size.width / 10).round()),
                      ),
                      child: ListView(
                        children: <Widget>[

                          // the first name and last name
                          Row(
                            children: <Widget>[

                              // the first name
                              Flexible(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: _outlineInputBorder,
                                    enabledBorder: _outlineInputBorder,
                                    errorBorder: _outlineInputBorder,
                                    disabledBorder: _outlineInputBorder,
                                    border: _outlineInputBorder,
                                    hintText: 'First Name',
                                    hintStyle: TextStyle(
                                      fontSize: screenUtil.setSp(40),
                                    ),
                                    contentPadding: EdgeInsets.all(screenUtil.setWidth(50)),
                                  ),
                                ),
                              ),

                              // space
                              Padding(
                                padding: EdgeInsets.all(screenUtil.setWidth(10)),
                              ),

                              // the last name
                              Flexible(
                                child:  TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: _outlineInputBorder,
                                    enabledBorder: _outlineInputBorder,
                                    errorBorder: _outlineInputBorder,
                                    disabledBorder: _outlineInputBorder,
                                    border: _outlineInputBorder,
                                    hintText: 'Last Name',
                                    hintStyle: TextStyle(
                                      fontSize: screenUtil.setSp(40),
                                    ),
                                    contentPadding: EdgeInsets.all(screenUtil.setWidth(50)),
                                  ),
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),

                          // space
                          Padding(
                            padding: EdgeInsets.all(screenUtil.setWidth(20)),
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

                          // space
                          Padding(
                            padding: EdgeInsets.all(screenUtil.setWidth(20)),
                          ),

                          CurrentLocationField(),

                          // space
                          Padding(
                            padding: EdgeInsets.all(screenUtil.setWidth(20)),
                          ),

                          // the phone field
                          Row(
                            children: <Widget>[

                              // country code
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
//                                    showDialog(
//                                      context: context,
//                                      child: CustomAlertDialog(
//                                        titlePadding: EdgeInsets.all(0.0),
//                                        contentPadding: EdgeInsets.all(0.0),
//                                        content: CountryCode(
//                                          onCountryCodeSelected: (countryCode) {
//                                            setState(() {
//                                              _countryCode = countryCode;
//                                            });
//                                          },
//                                        ),
//                                      ),
//                                    );
                                  },

                                  child: Container(
                                    alignment: Alignment.center,
                                    width: screenUtil.setWidth(800),
                                    padding: EdgeInsets.all(screenUtil.setWidth(50)),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    child: Text(_countryCode,
                                      style: TextStyle(
                                        fontSize: screenUtil.setSp(40),
                                        color: Color(0xff878787),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // spacing
                              Padding(
                                padding: EdgeInsets.all(screenUtil.setWidth(10)),
                              ),

                              // the phone field
                              Flexible(
                                flex: 3,
                                child: TextFormField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: _outlineInputBorder,
                                    enabledBorder: _outlineInputBorder,
                                    errorBorder: _outlineInputBorder,
                                    disabledBorder: _outlineInputBorder,
                                    border: _outlineInputBorder,
                                    hintText: 'Phone (111 111 1111)',
                                    hintStyle: TextStyle(
                                      fontSize: screenUtil.setSp(40),
                                    ),
                                    contentPadding: EdgeInsets.all(screenUtil.setWidth(50)),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // space
                          Padding(
                            padding: EdgeInsets.all(screenUtil.setWidth(20)),
                          ),

                          // the password
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

                          // space
                          Padding(
                            padding: EdgeInsets.all(screenUtil.setWidth(20)),
                          ),

                          // confirm password
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
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                fontSize: screenUtil.setSp(40),
                              ),
                              contentPadding: EdgeInsets.all(screenUtil.setWidth(50)),
                            ),
                          ),

                          // space
                          Padding(
                            padding: EdgeInsets.all(screenUtil.setWidth(20)),
                          ),

                          // Sign up button
                          Padding(
                            padding: EdgeInsets.only(left: screenUtil.setWidth(550), bottom: screenUtil.setWidth(500)),
                            child: Container(
                              alignment: Alignment.center,
                              height: screenUtil.setHeight(150),
                              width: screenUtil.setWidth(300),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(80.0),),
                                color: Color(0xffFC550A),
                              ),
                              child: Text('Sign Up',
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
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    // the sign in label
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: screenUtil.setHeight(200),
                        width: screenUtil.setWidth(600),
                        child: Text('Already have an account?',
                          style: TextStyle(
                            fontSize: screenUtil.setSp(45),
                            //decoration: TextDecoration.underline,
                          ),

                        ),
                      ),
                    ),

                    // the sign in button
                    Flexible(
                      child: GestureDetector(
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
                    ),

                  ],
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}

class CurrentLocationField extends StatefulWidget {
  @override
  _CurrentLocationFieldState createState() => _CurrentLocationFieldState();
}

class _CurrentLocationFieldState extends State<CurrentLocationField> {

  bool _pressed;
  String _locationValue;

  static const googleMapPlatform = const MethodChannel('openTheGoogleMap');

  @override
  void initState() {
    _pressed = false;
    _locationValue = 'Share - Save Current Location';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          final int result = await googleMapPlatform.invokeMethod('getUserLocation');
          print('$result');
        } on PlatformException catch (e) {
          print('${e.toString()}');
        }
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
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(150),
        width: ScreenUtil().setWidth(1000),
        decoration: BoxDecoration(
          color: _pressed?Color(0xffD84401):Color(0xffFC550A),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Text(_locationValue,
          style: TextStyle(
              color: _pressed?Colors.grey:Colors.white,
              fontSize: ScreenUtil().setSp(50)
          ),
        ),
      ),
    );
  }
}

