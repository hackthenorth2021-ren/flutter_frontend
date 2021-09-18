// ignore_for_file: file_names

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/components/card.dart';
import 'package:flutter_frontend/screens/camera.dart';
import 'package:flutter_frontend/screens/inventory.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/constants.dart';

class HomeScreen extends StatefulWidget {
  final CameraDescription camera;

  HomeScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  static const String id = 'homescreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
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
                  //margin: EdgeInsets.only(right: 500),
                  width: MediaQuery.of(context).size.width - 80,
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

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ReusableCard(
        colour: kIsabel,
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
        ),
      ),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  //static final List<Widget> _widgetOptions = <Widget>[
  //  RecipePage(),
  //  RecipePage(),
  //  //RecipePage(),
  //  //Navigator.pushNamed(context, CameraScreen.id)
  //  //TakePictureScreen(
  //  //    //camera: camera,
  //  //    )
  //];
  //late CameraDescription camera;
  //late Future<void> _initializeControllerFuture;

  //@override
  //void initState() {
  //  // TODO: implement initState
  //  super.initState();
  //  availableCameras().then((availableCameras) {
  //    final cameras = availableCameras;
  //    camera = cameras.first;

  //    //_controller = CameraController(
  //    //  // Get a specific camera from the list of available cameras.
  //    //  camera,
  //    //  // Define the resolution to use.
  //    //  ResolutionPreset.medium,
  //    //);

  //    //_initializeControllerFuture = _controller.initialize();
  //  });
  //}

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, HomeScreen.id);
    }

    if (index == 1) {
      Navigator.pushNamed(context, InventoryScreen.id);
    }

    if (index == 2) {
      Navigator.pushNamed(context, CameraScreen.id);
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(child: RecipePage()),
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
