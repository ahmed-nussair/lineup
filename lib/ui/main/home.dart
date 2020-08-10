import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:lineup/ui/main/restaurants.dart';
import 'package:lineup/ui/screen_util.dart';
import 'package:lineup/ui/uimodels/drawer_item.dart';

import '../custome_icons.dart';
import 'ads.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  final _key = GlobalKey<ScaffoldState>();

  int _selectedPos;

  /// for drawer icon status (pressed or released)
  bool _drawerIconPressed;

  @override
  void initState() {
    _drawerIconPressed = false;
    _selectedPos = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Drawer Items
    List<DrawerItem> drawerItems = [

      // My profile
      DrawerItem('assets/drawer_icons/profile.png', 'My Profile', () {
        Navigator.of(context).pop();
        FocusScope.of(context).requestFocus(FocusNode());
      }),

      // Friends
      DrawerItem('assets/drawer_icons/friends.png', 'Friends', () {
        Navigator.of(context).pop();
        FocusScope.of(context).requestFocus(FocusNode());
      }),

      // Help & Support
      DrawerItem('assets/drawer_icons/help.png', 'Help & Support', () {
        Navigator.of(context).pop();
        FocusScope.of(context).requestFocus(FocusNode());
      }),

      // Settings
      DrawerItem('assets/drawer_icons/settings.png', 'Settings', () {
        Navigator.of(context).pop();
        FocusScope.of(context).requestFocus(FocusNode());
      }),

      // Term & Conditions
      DrawerItem('assets/drawer_icons/terms.png', 'Term & Conditions', () {
        Navigator.of(context).pop();
        FocusScope.of(context).requestFocus(FocusNode());
      }),
    ];

    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      drawer: WillPopScope(
        onWillPop: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          return true;
        },
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(ScreenUtil().setWidth(300)),
          ),
          child: Container(
            width: ScreenUtil().setWidth(700),
            child: Drawer(
              child: Container(
                width: ScreenUtil().setWidth(1000),
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0xffFC550A),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(ScreenUtil().setWidth(300)),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(300)),
                  child: ListView(
                    children: List.generate(drawerItems.length, (index){
                      return DrawerItemWidget(
                        title: drawerItems[index].title,
                        iconPath: drawerItems[index].iconPath,
                        onPressed: drawerItems[index].function,
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            // the header
            Container(
              height: ScreenUtil().setHeight(470),
              child: Stack(
                children: <Widget>[

                  // the header background
                  Container(
                    height: ScreenUtil().setHeight(400),
                    decoration: BoxDecoration(
                      color: Color(0xffD84401),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(ScreenUtil().setWidth(150)),

                      ),
                    ),
                  ),

                  // welcome and user location area
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Container(
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(250),
                      width: ScreenUtil().setWidth(600),
                      decoration: BoxDecoration(
                        color: Color(0xffFC550A),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(ScreenUtil().setWidth(150)),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(40),
                                  ),
                                  children: <TextSpan> [
                                    TextSpan(text: 'Welcome '),
                                    TextSpan(text: 'Sam',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                  ],
                                ),

                              ),
                              Text('Select your location',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(40),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                          ),
                          Image.asset('assets/location.png',
                            height: ScreenUtil().setHeight(70),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // the drawer button
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(50)),
                      child: GestureDetector(
                        child: Image.asset('assets/more.png',
                          width: ScreenUtil().setWidth(70),
                          color: _drawerIconPressed?Colors.grey:Colors.white,
                        ),
                        onTap: () {
                          _key.currentState.openDrawer();
                        },
                        onTapDown: (details) {
                          setState(() {
                            _drawerIconPressed = true;
                          });
                        },
                        onTapUp: (details) {
                          setState(() {
                            _drawerIconPressed = false;
                          });
                        },
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0.0,
                    left: ScreenUtil().setWidth(150),
                    right: ScreenUtil().setWidth(150),
                    child: FilterAndSearchWidget(),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(

                children: <Widget>[
                  Ads(),

                  Restaurants(),

                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(50)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
            title: '',
            iconData: _selectedPos == 0?Icons.favorite:Icons.favorite_border,
          ),
          TabData(
            title: '',
            iconData: _selectedPos == 1?AppIcons.home:AppIcons.home_outline,
          ),
          TabData(
            title: '',
            iconData: Icons.receipt,
          ),
        ],
        activeIconColor: Colors.white,
        inactiveIconColor: Color(0xffFC550A),
        barBackgroundColor: Color(0xffF8F8F8),

        initialSelection: _selectedPos,
        circleColor: Color(0xffFC550A),
        onTabChangedListener: (int position) {
          setState(() {
            _selectedPos = position;
          });
        },
      ),
    );
  }

}


class DrawerItemWidget extends StatefulWidget {

  final String iconPath;
  final String title;
  final Function onPressed;

  DrawerItemWidget({@required this.iconPath, @required this.title, @required this.onPressed});
  @override
  _DrawerItemWidgetState createState() => _DrawerItemWidgetState();
}

class _DrawerItemWidgetState extends State<DrawerItemWidget> {

  bool _itemPressed;

  @override
  void initState() {
    _itemPressed = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            _itemPressed = true;
          });
        },
        onTapUp: (details) {
          setState(() {
            _itemPressed = false;
          });
          widget.onPressed();
        },
        child: Container(
          color: _itemPressed?Color(0xffC93E00):Color(0xffFC550A),
          padding: EdgeInsets.all(ScreenUtil().setWidth(40)),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Image.asset(widget.iconPath,
                  height: ScreenUtil().setHeight(90),
                  width: ScreenUtil().setWidth(90),
                  color: _itemPressed?Colors.grey:Colors.white,
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
              Flexible(
                child: Text(widget.title,
                  softWrap: false,
                  style: TextStyle(
                    color: _itemPressed?Colors.grey:Colors.white,
                    fontSize: ScreenUtil().setSp(40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterAndSearchWidget extends StatefulWidget {
  @override
  _FilterAndSearchWidgetState createState() => _FilterAndSearchWidgetState();
}

class _FilterAndSearchWidgetState extends State<FilterAndSearchWidget> {

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(100))),
    borderSide: BorderSide(
      width: 0.0,
      color: Colors.transparent,
    ),
  );

  bool _filterIconPressed;
  bool _searchIconPressed;

  @override
  void initState() {
    _filterIconPressed = false;
    _searchIconPressed = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: ScreenUtil().setWidth(1000),
          color: Colors.transparent,
          child: TextFormField(
            style: TextStyle(
                fontSize: ScreenUtil().setSp(40)
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: ScreenUtil().setWidth(100),
                top: ScreenUtil().setHeight(50),
                bottom: ScreenUtil().setHeight(50),
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(40),
              ),
              filled: true,
              fillColor: Color(0xffEFEFEF),
              focusedBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedErrorBorder: outlineInputBorder,
              border: outlineInputBorder,
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          top: 0.0,
          left: 0.0,
          child: GestureDetector(
            onTap: () {},
            onTapDown: (details) {
              setState(() {
                _filterIconPressed = true;
              });
            },
            onTapUp: (details) {
              setState(() {
                _filterIconPressed = false;
              });
            },
            child: Container(
              padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
              decoration: BoxDecoration(
                color: _filterIconPressed?Colors.grey.withOpacity(0.5):Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(ScreenUtil().setWidth(100)),
                  topLeft: Radius.circular(ScreenUtil().setWidth(100)),
                ),
              ),
              child: Image.asset('assets/filter.png',
                height: ScreenUtil().setHeight(50),
                width: ScreenUtil().setWidth(50),
                color: _filterIconPressed?Color(0xffD84401):Color(0xffFC550A),
              ),
            ),
          ),
        ),

        Positioned(
          top: 0.0, bottom: 0.0, right: 0.0,
          child: GestureDetector(
            onTapDown: (details) {
              setState(() {
                _searchIconPressed = true;
              });
            },
            onTapUp: (details) {
              setState(() {
                _searchIconPressed = false;
              });
            },
            child: Container(
              width: ScreenUtil().setWidth(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(ScreenUtil().setWidth(100)),
                  bottomRight: Radius.circular(ScreenUtil().setWidth(100)),
                  bottomLeft: Radius.circular(ScreenUtil().setWidth(100)),
                ),
                color: _searchIconPressed?Color(0xffD84401):Color(0xffFC550A),
              ),
              child: Icon(Icons.search,
                color: _searchIconPressed?Colors.grey:Colors.white,
                size: ScreenUtil().setWidth(50),
              ),
            ),
          ),
        ),
      ],
    );
  }
}





