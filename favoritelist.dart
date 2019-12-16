import 'package:aioapp2/lists.dart';
import 'package:flutter/material.dart';

final Set _saved = Set();

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Add to Favorites!'),
          centerTitle: true,
          backgroundColor: Colors.red),
      // backgroundColor: Colors.indigo,
      body: SafeArea(
        child: ListView.builder(
          itemCount: 53,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              activeColor: Colors.red,
              checkColor: Colors.white,
              // value: _saved.contains(context), // changed
              value: _saved.contains(index),
              onChanged: (val) {
                setState(() {
                  // isChecked = val;           // changed
                  // if(val == true){           // changed
                  //   _saved.add(context);     // changed
                  // } else{                    // changed
                  //   _saved.remove(context);  // changed
                  // }                          // changed
                  if (val == true) {
                    _saved.add(index);
                  } else {
                    _saved.remove(index);
                  }
                });
              },
              title: Row(
                children: <Widget>[
                  Image.asset('lib/images/${images[index]}'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(nameOfSite[index]),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.red,
        child: Icon(Icons.check),
        onPressed: () {
          Navigator.pop(context, _saved);
        },
      ),
    );
  }
}
