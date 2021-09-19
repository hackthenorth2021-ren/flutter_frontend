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
                    margin: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Chicken Soup', style: kTitleText),
                        Divider(
                          color: Colors.black,
                          thickness: 10,
                        ),
                        Text('Ingredients', style: TextStyle(fontSize: 18)),
                        Container(
                            //color: Colors.white,
                            height: 40,
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                            width: MediaQuery.of(context).size.width - 65,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text('Apple'),
                                    margin: EdgeInsets.only(left: 10),
                                  ),
                                ),
                                Text('x2'),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: IconButton(
                                    icon: Icon(FontAwesomeIcons.parachuteBox),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text('Directions',
                                style: TextStyle(fontSize: 18)))
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
