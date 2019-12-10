import 'package:flutter/material.dart';

import 'favoritelist.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Add Your Favorite Sites Here!❤',
            style: TextStyle(color: Colors.white)),
        Container(
            child: Icon(Icons.favorite, size: 150, color: Colors.blue[100])),
        SizedBox(height: 250),
        FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoriteList(),
              ),
            );
          },
          child: Icon(Icons.add),
          foregroundColor: Colors.blue,
        ),
      ],
    );
  }
}
