import 'package:aioapp2/lists.dart';
import 'package:flutter/material.dart';


class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  bool isChecked = false;

  final Set _saved = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 53,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            checkColor: Colors.indigo,
            value: isChecked,
            onChanged: (val) {
              setState(() {
                isChecked = val;
                if(val == true){
                  _saved.add(context);
                } else{
                  _saved.remove(context);
                }
              });
            },
            title: Row(
              children: <Widget>[
                Image.asset('lib/images/${images[index]}'),
                SizedBox(width: 10,),
                Text(nameOfSite[index]),
              ],
            ),
          );
        },
      ),
    );
  }
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
