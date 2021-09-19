import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';

class ReceipeScreen extends StatelessWidget {
  ReceipeScreen({Key? key}) : super(key: key);

  final recipeItem x = recipeItem.fromJson({
    'id': '1',
    'name': 'Slow Cooker Pot Roast',
    'directions':
        "In a slow cooker, mix cream of mushroom soup, dry onion soup mix and water. Place pot roast in slow cooker and coat with soup mixture.\nCook on High setting for 3 to 4 hours, or on Low setting for 8 to 9 hours.\n",
    "ingredients": [
      {"name": "mushroom soup", "amount": "21.5 ounce"},
      {"name": "onion soup", "amount": "1 ounce"},
      {"name": "pot roast", "amount": "5/2 pounds"}
    ],
    'image':
        'https://images.media-allrecipes.com/userphotos/560x315/2287775.jpg'
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.network(x.image),
              Positioned(
                top: 170,
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                  top: 180,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(x.name, style: kTitleText),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20, bottom: 15),
                            width: MediaQuery.of(context).size.width - 60,
                            height: 1,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffd7d7d7),
                              ),
                            ),
                          ),
                        ),
                        Text('Ingredients', style: TextStyle(fontSize: 18)),
                        Container(
                            //color: Colors.white,
                            height: 40,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 6,
                                  offset: Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width - 60,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text(x.ingredients[0]['name'],
                                        style: lightfont),
                                    margin: EdgeInsets.only(left: 10),
                                  ),
                                ),
                                Container(
                                  child: Text(x.ingredients[0]['amount'],
                                      style: lightfont),
                                  margin: EdgeInsets.only(right: 8),
                                ),
                                VerticalDivider(),
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: IconButton(
                                    icon: Icon(FontAwesomeIcons.parachuteBox),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            //color: Colors.white,
                            height: 40,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 6,
                                  offset: Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width - 60,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text(x.ingredients[1]['name'],
                                        style: lightfont),
                                    margin: EdgeInsets.only(left: 10),
                                  ),
                                ),
                                Container(
                                  child: Text(x.ingredients[1]['amount'],
                                      style: lightfont),
                                  margin: EdgeInsets.only(right: 8),
                                ),
                                VerticalDivider(),
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: IconButton(
                                    icon: Icon(FontAwesomeIcons.parachuteBox),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text('Directions',
                                style: TextStyle(fontSize: 18))),
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Text(
                              'In a slow cooker, mix cream of mushroom soup, dry onion soup mix and water. Place pot roast in slow cooker and coat with soup mixture.\nCook on High setting for 3 to 4 hours, or on Low setting for 8 to 9 hours.\n',
                              style: lightfont),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
