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
  final String image;
  final List<dynamic> ingredients;
  final String directions;

  recipeItem({
    required this.id,
    required this.name,
    required this.image,
    required this.ingredients,
    required this.directions,
  });

  factory recipeItem.fromJson(Map<String, dynamic> json) {
    return recipeItem(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        ingredients: json['ingredients'],
        directions: json['directions']);
  }

  static List<recipeItem> listFromJson(List json) {
    var list = <recipeItem>[];

    print(json);

    for (var i in json) {
      recipeItem item = recipeItem.fromJson(i);
      list.add(item);
    }

    return list;
  }

  static Future<List<recipeItem>> fetchRecipes() async {
    final uri = Uri.http(endpoint, '/api/v1/inventory/get-recipes', user);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<recipeItem> data = [];
      print(jsonDecode(response.body));
      jsonDecode(response.body).forEach((el) {
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
  const RecipeCard({Key? key, required this.item}) : super(key: key);

  final recipeItem item;

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
                  child: Image.network(
                    item.image,
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
                title: Text(item.name),
                subtitle: Text('${item.ingredients[0]['name']}, ...'),
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
  var futureRecipes = recipeItem.fetchRecipes();

  Widget projectWidget() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<recipeItem>> snapshot) {
        if (snapshot.hasData) {
          //print('project snapshot data is: ${projectSnap.data}');
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              recipeItem item = snapshot.data![index];
              return RecipeCard(item: item);
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
      future: futureRecipes,
    );
  }

  @override
  Widget build(BuildContext context) {
    recipeItem x = recipeItem.fromJson({
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

    recipeItem y = recipeItem.fromJson({
      'id': '2',
      'name': 'Instant Pot® Best Beef Stew',
      'directions':
          "In a slow cooker, mix cream of mushroom soup, dry onion soup mix and water. Place pot roast in slow cooker and coat with soup mixture.\nCook on High setting for 3 to 4 hours, or on Low setting for 8 to 9 hours.\n",
      "ingredients": [
        {"name": "butter", "amount": "1 tablespoon"},
        {"name": "onion soup", "amount": "1 ounce"},
        {"name": "pot roast", "amount": "5/2 pounds"}
      ],
      'image':
          'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5903471.jpg&w=574&h=384&c=sc&poi=face&q=85'
    });

    recipeItem z = recipeItem.fromJson({
      'id': '3',
      'name': 'Spiced Pumpkin Bread',
      'directions':
          "In a slow cooker, mix cream of mushroom soup, dry onion soup mix and water. Place pot roast in slow cooker and coat with soup mixture.\nCook on High setting for 3 to 4 hours, or on Low setting for 8 to 9 hours.\n",
      "ingredients": [
        {"name": "white sugar", "amount": "1 ½ cups"},
        {"name": "onion soup", "amount": "1 ounce"},
        {"name": "pot roast", "amount": "5/2 pounds"}
      ],
      'image':
          'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1061065.jpg&w=272&h=272&c=sc&poi=face&q=85'
    });

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
                children: [
                  RecipeCard(item: x),
                  RecipeCard(item: y),
                  RecipeCard(item: z)
                ],
              ),
            )
          ]),
    );
  }
}
