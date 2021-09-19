// ignore_for_file: file_names

import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/components/card.dart';
import 'package:flutter_frontend/screens/camera.dart';
import 'package:flutter_frontend/screens/inventory.dart';

import 'package:flutter_frontend/screens/recipe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/constants.dart';

import 'package:http/http.dart' as http;

class recipeItem {
  final String id;
  final String name;
  final List<dynamic> ingredients;
  final List<String> directions;

  recipeItem({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.directions,
  });

  factory recipeItem.fromJson(Map<String, dynamic> json) {
    return recipeItem(
        id: json['id'],
        name: json['name'],
        ingredients: json['creationdate'],
        directions: json['directions']);
  }

  static List<recipeItem> listFromJson(List<Map<String, dynamic>> json) {
    var list = <recipeItem>[];

    print(json);

    for (var i in json) {
      recipeItem item = recipeItem.fromJson(i);
      list.add(item);
    }
    //var item = inventoryItem.fromJson(json)

    return list;
  }

  static Future<List<recipeItem>> fetchInventory() async {
    final uri = Uri.http(endpoint, '/api/v1/inventory/get-inventory', user);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<recipeItem> data = [];
      print(jsonDecode(response.body));
      jsonDecode(response.body).forEach((el) {
        //final List<inventoryItem> sublist = el.map((val) => inventoryItem.fromJson(val)).toList();
        //data.add(inventoryItem(sublist));
        data.add(recipeItem.fromJson(el));
      });
      //print(data);
      print(data[0].name);

      return data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class _searchBar extends StatefulWidget {
  _searchBar({Key? key}) : super(key: key);

  @override
  __searchBarState createState() => __searchBarState();
}

class __searchBarState extends State<_searchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
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
                  //margin: EdgeInsets.only(right: 500),
                  width: MediaQuery.of(context).size.width - 80,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search recipe',
                      hintStyle: kHintStyle,
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

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ReusableCard(
        colour: kOpal,
        cardChild: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReceipeScreen()),
            );
          },
          child: Column(
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
                title: Text("Chicken soup"),
                subtitle: Text("Chicken"),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  _HomeScreenState createState() => _HomeScreenState(camera);
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  _HomeScreenState(CameraDescription camera) {
    _widgetOptions = <Widget>[
      RecipePage(),
      InventoryScreen(),
      TakePictureScreen(camera: camera)
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.utensils),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.camera),
            label: 'Add Food',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class RecipePage extends StatefulWidget {
  RecipePage({Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const ListTile(
              //leading: Icon(Icons.image),
              title: Text(
                "Hi Douglas",
                style: kTitleText,
              ),
              subtitle: Text(
                  "Vestibulum quis ligula nec neque ornare feugiat. Nunc condimentum, nunc su"),
            ),
            _searchBar(),
            Expanded(
              child: ListView(
                //shrinkWrap: true,
                children: [RecipeCard(), RecipeCard(), RecipeCard()],
              ),
            )
          ]),
    );
  }
}
