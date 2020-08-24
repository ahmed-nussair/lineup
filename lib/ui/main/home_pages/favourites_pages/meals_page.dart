import 'package:flutter/material.dart';
import 'package:lineup/ui/screen_util.dart';
import '../../../uimodels/meal_item.dart';

class MealsPage extends StatelessWidget {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meals[index].title,
                            style: TextStyle(
                              fontSize: _screenUtil.setWidth(50),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            meals[index].description,
                            style:
                                TextStyle(fontSize: _screenUtil.setWidth(45)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: _screenUtil.setWidth(50)),
                            child: Text(
                              '${meals[index].price} SR',
                              style:
                                  TextStyle(fontSize: _screenUtil.setWidth(40)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.network(
                      meals[index].imageUrl,
                      fit: BoxFit.cover,
                      width: _screenUtil.setWidth(300),
                    )
                  ],
                ),
              ),
              Divider(),
            ],
          );
        });
  }
}

List<MealItem> meals = [
  MealItem(
    title: 'Ranch',
    description:
        'Chicken breasts, cheddar cheese slices, lettuce, tomato, smoked turkey, ranch sauce',
    imageUrl:
        'https://i.ibb.co/C6JrKp2/8a89f1b0-b370-4197-88ec-b67b1c3fbc15.jpg',
    price: 70,
  ),
  MealItem(
    title: 'Rizo with Chicken Pieces',
    description: 'Spicy sauce or BBQ sauce',
    imageUrl:
        'https://i.ibb.co/xqdnKB3/5a1c5603-8aea-43cc-b815-e8f6fc2c59b3.jpg',
    price: 30,
  ),
  MealItem(
    title: 'Spicy Crunchy Chicken Wrap',
    description:
        'Spicy chicken strips, jalapeno, melted cheese sauce, mayonnaise sauce, lettuce, tomato, pickled cucumber, in tortilla bread',
    imageUrl:
        'https://i.ibb.co/q0pXnXP/edee1e6c-ae11-4f85-a10d-0ffe6fa45ada.jpg',
    price: 60,
  ),
  MealItem(
    title: 'Bazooka Sniper',
    description: '3 chicken crispy, fries, bread, coleslaw',
    imageUrl:
        'https://i.ibb.co/k5WXFSB/ff34c96e-2cbc-490f-bf66-a86f51551098.jpg',
    price: 65,
  ),
  MealItem(
    title: 'Crunchy Chicken with Ranch Large',
    description:
        'Crispy and crunchy chicken, mushroom, tomato, jalapeno pepper, ranch sauce and volcano sauce',
    imageUrl:
        'https://i.ibb.co/s6ct6RD/517d3485-e451-4656-a092-e32306077d1e.jpg',
    price: 100,
  ),
];
