import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_frontend/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;

class inventoryItem {
  final String id;
  final String name;
  final DateTime creationDate;
  final DateTime? expiryDate;
  final String expiryStr;

  inventoryItem({
    required this.id,
    required this.name,
    required this.creationDate,
    required this.expiryDate,
    required this.expiryStr,
  });

  factory inventoryItem.fromJson(Map<String, dynamic> json) {
    return inventoryItem(
        id: json['id'],
        name: json['name'],
        creationDate: DateTime.parse(json['creationdate']),
        expiryDate: json['expirydate'] != null
            ? DateTime.parse(json['expirydate'])
            : null,
        expiryStr: json['expiresIn']);
  }

  static List<inventoryItem> listFromJson(List<Map<String, dynamic>> json) {
    var list = <inventoryItem>[];

    print(json);

    for (var i in json) {
      inventoryItem item = inventoryItem.fromJson(i);
      list.add(item);
    }
    //var item = inventoryItem.fromJson(json)

    return list;
  }

  static Future<List<inventoryItem>> fetchInventory() async {
    final uri = Uri.http(endpoint, '/api/v1/inventory/get-inventory', user);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<inventoryItem> data = [];
      print(jsonDecode(response.body));
      jsonDecode(response.body).forEach((el) {
        //final List<inventoryItem> sublist = el.map((val) => inventoryItem.fromJson(val)).toList();
        //data.add(inventoryItem(sublist));
        data.add(inventoryItem.fromJson(el));
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

//var data = [
//    {
//      "id": "12345",                                          # Food ID
//      "name": "Apple",
//      "creationDate": "2021-09-17T02:12:28.000Z",             # ISO 8601 Date Format
//      "expiryDate": "2021-09-24T02:12:28.000Z"                # ISO 8601 Date Format
//    },
//    ...
//  ];

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
                  width: MediaQuery.of(context).size.width - 80,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search inventory',
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

class InventoryCard extends StatelessWidget {
  InventoryCard({Key? key, required this.item}) : super(key: key);

  inventoryItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/harvest.png',
              fit: BoxFit.scaleDown,
            ),
            Container(
              margin: EdgeInsets.only(left: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  item.expiryDate != null
                      ? Text(item.expiryStr,
                          style: TextStyle(color: Colors.orange))
                      : Text('No expiry date',
                          style: TextStyle(color: Colors.orange))
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      right: 20,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.close,
                            color: Colors.orange,
                          )))
                ],
              ),
            )
          ],
        ));
  }
}

class InventoryScreen extends StatelessWidget {
  InventoryScreen({Key? key}) : super(key: key);
  static const String id = 'inventory_screen';

  var futureInventory = inventoryItem.fetchInventory();

  Widget projectWidget() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<inventoryItem>> snapshot) {
        if (snapshot.hasData) {
          //print('project snapshot data is: ${projectSnap.data}');
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              inventoryItem item = snapshot.data![index];
              return InventoryCard(item: item);
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
      future: futureInventory,
    );
  }

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
              "Your Inventory",
              style: kTitleText,
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 8),
              //child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.center,
              //  children: [_searchBarInventory(), Text('Order by')],
              //),
              child: _searchBarInventory()),
          Expanded(child: projectWidget())
          //InventoryCard(),
        ],
      ),
    );
  }
}
