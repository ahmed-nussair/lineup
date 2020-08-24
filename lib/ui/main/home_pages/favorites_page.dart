import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lineup/ui/main/home_pages/favourites_pages/meals_page.dart';
import 'package:lineup/ui/main/home_pages/favourites_pages/restaurants_page.dart';
import 'package:lineup/ui/screen_util.dart';

import 'back_button.dart';

class Favorites extends StatefulWidget {
  final Function onBackTapped;

  Favorites({@required this.onBackTapped});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScreenUtil _screenUtil = ScreenUtil(
    allowFontScaling: true,
  );

  int _currentPosition;

  @override
  void initState() {
    _currentPosition = 0;
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: _currentPosition,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: _screenUtil.setHeight(170),
              alignment: Alignment.center,
              child: Text(
                'Favourites',
                style: TextStyle(fontSize: _screenUtil.setSp(40)),
              ),
            ),
            Expanded(
              child: Scaffold(
                appBar: AppBar(
                  title: Container(
                    color: Color(0xffFC550A),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: TabBar(
                      controller: _tabController,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: _screenUtil.setSp(40)),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      unselectedLabelColor: Color(0xff5f6368),
                      isScrollable: false,
                      // indicatorPadding: EdgeInsets.all(10),
                      indicator: MD2Indicator(
                        indicatorSize: MD2IndicatorSize.normal,
                        indicatorHeight: _screenUtil.setHeight(30),
                        indicatorColor: Color(0xffC84308),
                      ),
                      tabs: [
                        Tab(
                          text: 'Restaurants',
                        ),
                        Tab(
                          text: 'Meals',
                        )
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [RestaurantsPage(), MealsPage()],
                ),
              ),
            )
          ],
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          child: AppBackButton(
            onPressed: () => widget.onBackTapped(),
          ),
        )
      ],
    );
  }
}

enum MD2IndicatorSize {
  tiny,
  normal,
  full,
}

class MD2Indicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final MD2IndicatorSize indicatorSize;

  const MD2Indicator(
      {@required this.indicatorHeight,
      @required this.indicatorColor,
      @required this.indicatorSize});

  @override
  _MD2Painter createBoxPainter([VoidCallback onChanged]) {
    return new _MD2Painter(this, onChanged);
  }
}

class _MD2Painter extends BoxPainter {
  final MD2Indicator decoration;

  _MD2Painter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    Rect rect;
    if (decoration.indicatorSize == MD2IndicatorSize.full) {
      rect = Offset(offset.dx,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(configuration.size.width, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == MD2IndicatorSize.normal) {
      rect = Offset(offset.dx + 10,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(configuration.size.width - 20, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == MD2IndicatorSize.tiny) {
      rect = Offset(offset.dx + configuration.size.width / 2 - 8,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(16, decoration.indicatorHeight ?? 3);
    }

    final Paint paint = Paint();
    paint.color = decoration.indicatorColor ?? Color(0xff1967d2);
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(rect,
            topRight: Radius.circular(ScreenUtil().setWidth(30)),
            bottomLeft: Radius.circular(ScreenUtil().setWidth(30))),
        paint);
  }
}
