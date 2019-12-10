import 'package:aioapp2/lists.dart';
import 'package:flutter/material.dart';


class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  final Set<FavoriteList> _saved = Set<FavoriteList>();
  @override
  Widget build(BuildContext context) {
    final bool alreadySaved = _saved.contains(context);
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 53,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  subtitle: Row(
                    children: <Widget>[
                      Image.asset('lib/images/${images[index]}'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        nameOfSite[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    alreadySaved ? Icons.favorite : Icons.favorite_border,
                    color: alreadySaved ? Colors.red : null,
                  ),
                  onTap: () {
                    setState(() {
                      if (alreadySaved) {
                        _saved.remove(context);
                      } else {
                        _saved.add(context);
                      }
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
