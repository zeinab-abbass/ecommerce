import 'package:flutter/material.dart';
import 'package:frontend/models/Slide.model.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 300,
            child: Image.asset(
            slideList[index].imageUrl,
            fit: BoxFit.contain,
            height: 350,
          )
          ),
          Text(
            slideList[index].title,
            style: TextStyle(
                fontSize: 22,
                fontFamily: 'CM Sans Serif',
                color: Colors.indigo.shade900,
                fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            slideList[index].description,
          ),
        ],
      ),
    );
  }
}