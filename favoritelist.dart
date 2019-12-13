import 'package:aioapp2/lists.dart';
import 'package:flutter/material.dart';

class _FavoriteListState extends State<FavoriteList> {
  final _suggestions = [];
  final Set<Widget> _saved = Set<Widget>();

  Widget _buildList() {
    return ListView.builder(
      itemCount: 53,
      itemBuilder: (BuildContext context, int index) {
        return _buildRow(_suggestions[index], index);
      },
    );
  }

  Widget _buildRow(BuildContext context, int index){
    // final bool alreadySaved = _saved.contains(website);
    return Card(
      child: Container(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          subtitle: Row(
            children: <Widget>[
              Image.asset('lib/images/${images[index]}'),
              Text(nameOfSite[index]),
            ],
          ),
          onTap: (){},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }
}

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

// Scaffold(
//       body: SafeArea(
//         child: ListView.builder(
//           itemCount: 53,
//           itemBuilder: (BuildContext context, int index) {
            // return Card(
            //   child: Container(
            //     child: ListTile(
            //       contentPadding:
            //           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //       subtitle: Row(
            //         children: <Widget>[
            //           Image.asset('lib/images/${images[index]}'),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Text(
            //             nameOfSite[index],
            //             style: TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       ),
            //       trailing: InkWell(
            //         onTap: () {
            //           if (alreadySaved) {
            //             _saved.remove(context);
            //           } else {
            //             _saved.add(context);
            //           }
            //         },
            //         child: Icon(
            //           alreadySaved ? Icons.favorite : Icons.favorite_border,
            //           color: alreadySaved ? Colors.red : null,
            //         ),
            //       ),
            //     ),
            //   ),
            // );
//           },
//         ),
//       ),
//     );
