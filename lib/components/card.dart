import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({Key? key, required this.colour, required this.cardChild}) : super(key: key);
  final Color colour;
  final Widget cardChild;
  //final DecorationImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        // image: image,
        color: colour,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(204, 204, 204, 0.5),
            blurRadius: 25,
            //spreadRadius: 10,
            offset: Offset(8, 8), // Shadow position
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
