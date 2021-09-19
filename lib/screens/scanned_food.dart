// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_frontend/components/card.dart';
import 'dart:math' as math;

import 'package:flutter_frontend/components/constants.dart';

class scannedItem {
  final String name;
  final DateTime? expiryDate;

  scannedItem({
    required this.name,
    required this.expiryDate,
  });

  factory scannedItem.fromJson(Map<dynamic, dynamic> json) {
    return scannedItem(
        name: json['name'],
        expiryDate: json['expirydate'] != null
            ? DateTime.parse(json['expirydate'])
            : null);
  }

  static List<scannedItem> listFromJson(List<Map<String, dynamic>> json) {
    var list = <scannedItem>[];

    print(json);

    for (var i in json) {
      scannedItem item = scannedItem.fromJson(i);
      list.add(item);
    }
    //var item = inventoryItem.fromJson(json)

    return list;
  }

  //static Future<List<scannedItem>> fetchInventory() async {
  //  final uri = Uri.http(endpoint, '/api/v1/inventory/get-inventory', user);

  //  final response = await http.get(uri);

  //  if (response.statusCode == 200) {
  //    // If the server did return a 200 OK response,
  //    // then parse the JSON.
  //    List<inventoryItem> data = [];
  //    print(jsonDecode(response.body));
  //    jsonDecode(response.body).forEach((el) {
  //      //final List<inventoryItem> sublist = el.map((val) => inventoryItem.fromJson(val)).toList();
  //      //data.add(inventoryItem(sublist));
  //      data.add(inventoryItem.fromJson(el));
  //    });
  //    //print(data);
  //    print(data[0].name);

  //    return data;
  //  } else {
  //    // If the server did not return a 200 OK response,
  //    // then throw an exception.
  //    throw Exception('Failed to load album');
  //  }
  //}
}

class ScannedFoodScreen extends StatefulWidget {
  const ScannedFoodScreen({
    Key? key,
    required this.map,
  }) : super(key: key);

  final List<Map> map;

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
              child: ListView.separated(
                itemCount: widget.map.length,
                itemBuilder: (context, index) {
                  scannedItem item = scannedItem.fromJson(widget.map[index]);
                  return RowElement(
                    name: item.name,
                    expiry: item.expiryDate,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowElement extends StatelessWidget {
  RowElement({Key? key, required this.name, required this.expiry})
      : super(key: key);

  var name;
  var expiry;

  final _nameController = TextEditingController();
  final _expiryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = name;
    _expiryController.text = expiry;

    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 20),
            child: Container(
              child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
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
                  controller: _expiryController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
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
