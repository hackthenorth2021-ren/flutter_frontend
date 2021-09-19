import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReceipeScreen extends StatelessWidget {
  const ReceipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset('assets/sadge.jpg'),
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
                        Text('Wonton Soup', style: kTitleText),
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
                                    child: Text('Apple', style: lightfont),
                                    margin: EdgeInsets.only(left: 10),
                                  ),
                                ),
                                Container(
                                  child: Text('x2', style: lightfont),
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
                        Text('1.', style: lightfont),
                        Text('2.', style: lightfont)
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
