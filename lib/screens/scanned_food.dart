// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_frontend/components/card.dart';
import 'dart:math' as math;

import 'package:flutter_frontend/components/constants.dart';

class ScannedFoodScreen extends StatefulWidget {
  @override
  _ScannedFoodScreenState createState() => _ScannedFoodScreenState();
}

class _ScannedFoodScreenState extends State<ScannedFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ListTile(
              //leading: Icon(Icons.image),
              title: Text(
                "Scanned Food",
                style: kTitleText,
              ),
            ),
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Text('Name', style: TextStyle(fontSize: 18)),
                    flex: 3,
                  ),
                  Expanded(
                      child: Text('Expiry', style: TextStyle(fontSize: 18)),
                      flex: 2),
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Container(
                        child: TextField(
                            decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                          hintText: 'Username',
                        )),
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xffeeeeee),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3fe8e8e8),
                              blurRadius: 45,
                              offset: Offset(15, 20),
                            ),
                          ],
                          color: Colors.white,
                        ),
                      ),
                      //margin: EdgeInsets.symmetric(horizontal: 5),
                    ),
                    flex: 3,
                  ),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Container(
                          height: 35,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                              hintText: 'Username',
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xffeeeeee),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3fe8e8e8),
                                blurRadius: 45,
                                offset: Offset(15, 20),
                              ),
                            ],
                            color: Colors.white,
                          ),
                        ),
                      ),
                      flex: 2),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Colors.orange,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Group18144Widget extends StatefulWidget {
  @override
  _Group18144WidgetState createState() => _Group18144WidgetState();
}

class _Group18144WidgetState extends State<Group18144Widget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group18144Widget - GROUP

    return Container(
        width: 343.4195556640625,
        height: 33,
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 209,
                  height: 33,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 201.09295654296875,
                            height: 33,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(232, 232, 232, 0.25),
                                    offset: Offset(15, 20),
                                    blurRadius: 45)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                color: Color.fromRGBO(238, 238, 238, 1),
                                width: 1,
                              ),
                            ))),
                    Positioned(
                        top: 5,
                        left: 13.010932922363281,
                        child: Text(
                          'Orange',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ]))),
          Positioned(
              top: 0,
              left: 215,
              child: Container(
                  width: 88,
                  height: 33,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 88,
                            height: 33,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(232, 232, 232, 0.25),
                                    offset: Offset(15, 20),
                                    blurRadius: 45)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                color: Color.fromRGBO(238, 238, 238, 1),
                                width: 1,
                              ),
                            ))),
                    Positioned(
                        top: 6,
                        left: 7,
                        child: Text(
                          '3 weeks',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ]))),
          Positioned(
              top: 11,
              left: 333,
              child: Container(
                  width: 10.419568061828613,
                  height: 10.385284423828125,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: -0.000024755518097663298,
                        child: Transform.rotate(
                          angle: 44.90985652947403 * (math.pi / 180),
                          child: Image.asset("assets/harvest.png"),
                        )),
                    Positioned(
                        top: 10.385284423828125,
                        left: 0.0018831266788765788,
                        child: Transform.rotate(
                          angle: 44.90985652947403 * (math.pi / 180),
                          child: Image.asset("assets/harvest.png"),
                        )),
                  ]))),
        ]));
  }
}
