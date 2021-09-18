// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_frontend/components/card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/constants.dart';

class _searchBar extends StatefulWidget {
  _searchBar({Key? key}) : super(key: key);

  @override
  __searchBarState createState() => __searchBarState();
}

class __searchBarState extends State<_searchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xfff3f3f3),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //width: 24,
                  margin: EdgeInsets.only(left: 8),
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    FontAwesomeIcons.search,
                    size: 14,
                  ),
                ),
                SizedBox(width: 11),
                Container(
                  //margin: EdgeInsets.only(bottom: 5),
                  width: 300,
                  child: TextField(
                    decoration: new InputDecoration(
                      hintText: 'Search Recipe',
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                    style: TextStyle(decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            const ListTile(
              leading: Icon(Icons.image),
              title: Text(
                "Hello Douglas",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text(
                  "Vestibulum quis ligula nec neque ornare feugiat. Nunc condimentum, nunc su"),
            ),
            _searchBar(),
            ReusableCard(
                colour: kOpal,
                cardChild: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 5 / 2,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          'assets/sadge.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(0),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ListTile(
                      title: Text("Im gay"),
                      subtitle: Text("Kevin has gay benis"),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                )),
          ])),
      //bottomNavigationBar:
      //    BottomNavigationBar(items: const <BottomNavigationBarItem>[]),
    );
  }
}
