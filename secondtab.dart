import 'package:flutter/material.dart';
import 'favoritelist.dart';

final Set saved = Set(); //location of 'saved' Set changed from the 'favoritelist.dart' to here!

List favorites = List();

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return //return - favorite list if any item is checked, if not then just return container and a FAB!
     Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // ListView.builder(
        //   itemCount: saved.length,
        //   itemBuilder: (context, index){
        //     return ListTile(
        //       title: Row(
        //         children: <Widget>[
        //           Image.asset('lib/images/${saved[index]}' //this is not working but i need 
        //             this to make it exactly like the items select screen! and also the Text(saved[index]) not working. Same Case!
        //         ],
        //       ),
        //     );
        //   },
        // ),
        Text(
          'Add Your Favorite Sites Here!❤',
          style: TextStyle(color: Colors.white),
        ),
        Container(
          child: Icon(Icons.favorite, size: 150, color: Colors.blue[100]),
        ),
        SizedBox(height: 250),
        FloatingActionButton(
          onPressed: () async{
            Set newSet = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoriteList(),
              ),
            );
            setState(() {
              favorites = newSet.toList();
            });
            print(newSet);
          },
          child: Icon(Icons.add),
          foregroundColor: Colors.blue,
        ),
      ],
    );
  }
}
