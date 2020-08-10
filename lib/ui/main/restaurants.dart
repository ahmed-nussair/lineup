import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lineup/ui/screen_util.dart';
import 'package:lineup/ui/uimodels/restaurant_item.dart';

class Restaurants extends StatefulWidget {
  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        // the title
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setWidth(20), bottom: ScreenUtil().setWidth(20)),
          height: ScreenUtil().setHeight(150),
          width: double.infinity,
          color: Color(0xffF75309),
          alignment: Alignment.center,
          child: Text('Restaurants',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(50),
            ),
          ),
        ),

        // the carousel slider
        CarouselSlider(
          items: List.generate(restaurantItems.length, (index){

            String typeText = '';

            for(int i = 0 ; i < restaurantItems[index].type.length; i ++) {
              if(i < restaurantItems[index].type.length - 1) {
                typeText += '${restaurantItems[index].type[i]} . ';
              } else {
                typeText += '${restaurantItems[index].type[i]}';
              }
            }
            return Container(
              margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
              child: ClipRRect(

                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(50))),
                child: Stack(children: <Widget>[

                  // the background image
                  Image.network(restaurantItems[index].backgroundImageUrl, fit: BoxFit.cover,
                    width: ScreenUtil().setWidth(1000),
                    height: ScreenUtil().setHeight(1000),
                  ),

                  // background layer
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    bottom: 0.0,
                    right: 0.0,
                    child: Container(
                      height: ScreenUtil().setHeight(1000),
                      width: ScreenUtil().setWidth(1000),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),

                  // add to favourite
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(50)),
                      child: Favourite(),
                    ),
                  ),

                  // the featured ribbon
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Padding(
                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(70)),
                      child: Image.asset('assets/ribbon.png',
                        height: ScreenUtil().setHeight(150),
                      ),
                    ),
                  ),

                  // the restaurant data
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: ScreenUtil().setWidth(50),
                        left: ScreenUtil().setWidth(20),
                      ),
                      child: Row(
                        children: <Widget>[

                          // restaurant logo
                          Flexible(
                            flex: 1,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                restaurantItems[index].logoUrl,
                              ),
                              radius: ScreenUtil().setHeight(80),
                            ),
                          ),

                          // some spacing
                          SizedBox(
                            width: ScreenUtil().setWidth(20),
                          ),

                          // restaurant data
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                // restaurant title
                                Text(restaurantItems[index].title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(70),
                                  ),
                                ),

                                // restaurant type
                                Text(typeText,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(40),
                                  ),
                                ),

                                // the distance and rating
                                Row(
                                  children: <Widget>[

                                    // the distance
                                    Row(
                                      children: <Widget>[
                                        Image.asset('assets/location.png',
                                          width: ScreenUtil().setWidth(50),
                                        ),
                                        Text('${restaurantItems[index].distance} Km',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(40),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // some spacing
                                    SizedBox(
                                      width: ScreenUtil().setWidth(50),
                                    ),

                                    // rating
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.star,
                                          color: Color(0xffFFC107),
                                        ),
                                        Text('${restaurantItems[index].rating}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(40),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ]),
              ),
            );
          }),
          autoPlay: false,
          enlargeCenterPage: true,
          aspectRatio: 1.8,
          viewportFraction: 0.8,
        ),
      ],
    );
  }
}

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {

  bool _favourite;

  @override
  void initState() {
    _favourite = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _favourite = _favourite?false:true;
        });
      },
      child: Icon(_favourite?Icons.favorite:Icons.favorite_border,
        color: Colors.white,
        size: ScreenUtil().setSp(70),
      ),
    );
  }
}


final List<RestaurantItem> restaurantItems = [
  RestaurantItem(
    title: 'Double D\'s Pizza',
    backgroundImageUrl: 'https://i.ibb.co/bQYrJJK/double-ds-bg.jpg',
    logoUrl: 'https://i.ibb.co/Xs4nL5B/double-ds-log.jpg',
    type: ['Fast Food','Italian','Pizza',],
    distance: 5.5,
    rating: 4.7,
  ),
  RestaurantItem(
    title: 'بلد الغريب',
    backgroundImageUrl: 'https://i.ibb.co/f0vyrp7/el-ghareeb-bg.jpg',
    logoUrl: 'https://i.ibb.co/J7VdWVp/el-ghareeb-logo.jpg',
    type: ['Seafood',],
    distance: 3.5,
    rating: 4.0,
  ),
  RestaurantItem(
    title: 'Bazooka',
    backgroundImageUrl: 'https://i.ibb.co/c265bbt/bazooka-bg.jpg',
    logoUrl: 'https://i.ibb.co/NKFwCFF/bazooka-logo.jpg',
    type: ['Burgers','Sandwiches',],
    distance: 4.0,
    rating: 4.2,
  ),
];
