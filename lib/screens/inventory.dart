import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _searchBarInventory extends StatefulWidget {
  _searchBarInventory({Key? key}) : super(key: key);

  @override
  _searchBarInventoryState createState() => _searchBarInventoryState();
}

class _searchBarInventoryState extends State<_searchBarInventory> {
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
                  width: MediaQuery.of(context).size.width - 140,
                  child: TextField(
                    decoration: new InputDecoration(
                      hintText: 'Search inventory',
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

class InventoryCard extends StatelessWidget {
  const InventoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: EdgeInsets.only(left: 30, top: 8),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/harvest.png',
              fit: BoxFit.scaleDown,
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Apple'), Text("Expires in 3 days")],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      right: 20,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(FontAwesomeIcons.times)))
                ],
              ),
            )
          ],
        ));
  }
}

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({Key? key}) : super(key: key);
  static const String id = 'inventory_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ListTile(
            //leading: Icon(Icons.image),
            title: Text(
              "Inventory",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_searchBarInventory(), Text('Order by')],
          ),
          InventoryCard(),
        ],
      ),
    );
  }
}
