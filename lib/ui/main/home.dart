import 'dart:io';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineup/ui/main/home_page_bloc/home_page_bloc.dart';
import 'package:lineup/ui/main/home_pages/friends_page.dart';
import 'package:lineup/ui/main/home_pages/hep_support_page.dart';
import 'package:lineup/ui/main/home_pages/main_page.dart';
import 'package:lineup/ui/main/home_pages/settings_page.dart';
import 'package:lineup/ui/main/home_pages/terms_conditions_page.dart';
import 'package:lineup/ui/uimodels/drawer_item.dart';

import '../custome_icons.dart';
import 'home_pages/favorites_page.dart';
import 'home_pages/orders_page.dart';
import 'home_pages/profile_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _selectedPos;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    _selectedPos = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? SafeArea(
            child: _body(),
          )
        : _body();
  }

  Widget _body() {
    // Drawer Items

    return BlocProvider(
      create: (_) => HomePageBloc()..add(NavigateToMainPage()),
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          final _returnHome = () {
            final FancyBottomNavigationState fState =
                bottomNavigationKey.currentState;
            fState.setPage(1);
            BlocProvider.of<HomePageBloc>(context).add(NavigateToMainPage());
          };

          List<DrawerItem> drawerItems = [
            // My profile
            DrawerItem('assets/drawer_icons/profile.png', 'My Profile', () {
              Navigator.of(context).pop();
              FocusScope.of(context).requestFocus(FocusNode());
              BlocProvider.of<HomePageBloc>(context).add(NavigateToProfile());
            }),

            // Friends
            DrawerItem('assets/drawer_icons/friends.png', 'Friends', () {
              Navigator.of(context).pop();
              FocusScope.of(context).requestFocus(FocusNode());
              BlocProvider.of<HomePageBloc>(context).add(NavigateToFriends());
            }),

            // Help & Support
            DrawerItem('assets/drawer_icons/help.png', 'Help & Support', () {
              Navigator.of(context).pop();
              FocusScope.of(context).requestFocus(FocusNode());
              BlocProvider.of<HomePageBloc>(context)
                  .add(NavigateToHelpSupport());
            }),

            // Settings
            DrawerItem('assets/drawer_icons/settings.png', 'Settings', () {
              Navigator.of(context).pop();
              FocusScope.of(context).requestFocus(FocusNode());
              BlocProvider.of<HomePageBloc>(context).add(NavigateToSettings());
            }),

            // Term & Conditions
            DrawerItem('assets/drawer_icons/terms.png', 'Term & Conditions',
                () {
              Navigator.of(context).pop();
              FocusScope.of(context).requestFocus(FocusNode());
              BlocProvider.of<HomePageBloc>(context)
                  .add(NavigateToTermsConditions());
            }),
          ];

          return Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: state is MainPageState
                ? MainPage(
                    drawerItems: drawerItems,
                  )
                : state is FavoritesState
                    ? Favorites(
                        onBackTapped: _returnHome,
                      )
                    : state is OrdersState
                        ? Orders(
                            onBackTapped: _returnHome,
                          )
                        : state is ProfileState
                            ? Profile(
                                onBackTapped: _returnHome,
                              )
                            : state is FriendsState
                                ? Friends(
                                    onBackTapped: _returnHome,
                                  )
                                : state is SettingsState
                                    ? SettingsPage(
                                        onBackTapped: _returnHome,
                                      )
                                    : state is HelpSupportState
                                        ? HelpAndSupport(
                                            onBackTapped: _returnHome,
                                          )
                                        : state is TermsConditionsState
                                            ? TermsAndConditions(
                                                onBackTapped: _returnHome,
                                              )
                                            : Container(),
            bottomNavigationBar: FancyBottomNavigation(
              key: bottomNavigationKey,
              tabs: [
                TabData(
                  title: '',
                  iconData: _selectedPos == 0
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                TabData(
                    title: '',
                    iconData: _selectedPos == 1
                        ? AppIcons.home
                        : AppIcons.home_outline,
                    onclick: () => BlocProvider.of<HomePageBloc>(context)
                        .add(NavigateToMainPage())),
                TabData(
                    title: '',
                    iconData: Icons.receipt,
                    onclick: () => BlocProvider.of<HomePageBloc>(context)
                        .add(NavigateToOrders())),
              ],
              activeIconColor: Colors.white,
              inactiveIconColor: Color(0xffFC550A),
              barBackgroundColor: Color(0xffF8F8F8),
              initialSelection: 1,
              circleColor: Color(0xffFC550A),
              onTabChangedListener: (int position) {
                setState(() {
                  _selectedPos = position;
                });
                switch (position) {
                  case 0:
                    BlocProvider.of<HomePageBloc>(context)
                        .add(NavigateToFavorites());
                    break;
                  case 1:
                    BlocProvider.of<HomePageBloc>(context)
                        .add(NavigateToMainPage());
                    break;
                  case 2:
                    BlocProvider.of<HomePageBloc>(context)
                        .add(NavigateToOrders());
                    break;
                }
              },
            ),
          );
        },
      ),
    );
  }
}
