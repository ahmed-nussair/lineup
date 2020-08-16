import 'package:flutter/material.dart';
import 'package:lineup/ui/screen_util.dart';

class AppBackButton extends StatefulWidget {
  final Function onPressed;

  AppBackButton({@required this.onPressed});

  @override
  _AppBackButtonState createState() => _AppBackButtonState();
}

class _AppBackButtonState extends State<AppBackButton> {
  bool _pressed;

  @override
  void initState() {
    _pressed = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(),
      onTapUp: (details) {
        setState(() {
          _pressed = false;
        });
      },
      onTapDown: (details) {
        setState(() {
          _pressed = true;
        });
      },
      child: Container(
        height: ScreenUtil().setHeight(150),
        width: ScreenUtil().setWidth(150),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(ScreenUtil().setWidth(70))),
          color: _pressed ? Color(0xffC93E00) : Color(0xffFC550A),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: ScreenUtil().setSp(50),
        ),
      ),
    );
  }
}
