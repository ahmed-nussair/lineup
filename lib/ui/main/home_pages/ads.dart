import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lineup/ui/screen_util.dart';

class Ads extends StatefulWidget {
  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<Ads> {

  int _currentPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
      child: Column(
        children: <Widget>[
          CarouselSlider(
            items: List.generate(images.length, (index){
              return Image.network(images[index],
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              );
            }),
            autoPlay: false,
            enlargeCenterPage: false,
            aspectRatio: 1.8,
            viewportFraction: 1.0,
            onPageChanged: (current) {
              setState(() {
                _currentPosition = current;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setHeight(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (i) {
                return Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                  child: Container(
                    height: i == _currentPosition? ScreenUtil().setHeight(35): ScreenUtil().setHeight(30),
                    width: i == _currentPosition? ScreenUtil().setWidth(150): ScreenUtil().setWidth(30),
                    decoration: BoxDecoration(
                        color: i == _currentPosition ? Color(0xffFC550A): Color(0xffFFE2D5),
                        borderRadius: BorderRadius.circular(ScreenUtil().setHeight(70))
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

final List images = [
  'https://i.ytimg.com/vi/ZziwZL3OSxo/maxresdefault.jpg',
  'https://i.ibb.co/SKDMp6X/974acdbb0191cfd889affac7ed2ad2a0-print-ads-fish-tacos.jpg',
  'https://i.ibb.co/zS0HqDW/food-social-media-post-banner-template-restaurant-91705-40.jpg',
];
