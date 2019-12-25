// import 'package:aioapp2/favoritelist.dart';
// import 'package:flutter/material.dart';

// import 'lists.dart';

// List newList = [];

// class SecondPage extends StatefulWidget {
//   @override
//   _SecondPageState createState() => _SecondPageState();
// }

// class _SecondPageState extends State<SecondPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(30),
//       child: Stack(
//         alignment: Alignment.bottomRight,
//         children: <Widget>[
//           ListView.builder(
//             itemCount: newList.length,
//             itemBuilder: (context, index) {
//               return Row(
//                 children: <Widget>[
//                   Image.asset('lib/images/${images[newList.elementAt(index)]}'),
//                   Text(nameOfSite[newList.elementAt(index)]),
//                   // Image.asset('lib/images/${images[newList.elementAt(index)]}'),
//                   // Text('item: ${newList.elementAt(index)}')
//                 ],
//               );
//             },
//           ),
//           FloatingActionButton(
//             child: Icon(
//               Icons.add,
//               color: Colors.blue,
//             ),
//             onPressed: () async {
//               List newList = await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => FavoriteList(),
//                 ),
//               );
//               setState(() {
//                 print(newList);
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lists.dart';

Set<int> favorites = {};

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Future<void> _upDateFavorites(Set<int> updatedFavorites) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> favoritesAsString =
        favorites.map((fav) => fav.toString()).toList();
    pref.setStringList("favorites", favoritesAsString);
    favorites = updatedFavorites;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _getFavoriteList(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditFavorites(),
                  ),
                ).then((updatedFavorites) async {
                  if (updatedFavorites != null)
                    // setState(() {
                    _upDateFavorites(updatedFavorites);
                  // });
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _getFavoriteList() {
    if (favorites?.isNotEmpty == true)
      return _FavoriteList();
    else
      return _EmptyFavoriteList();
  }
}

class _EmptyFavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Add Your Favorite Sites Here!❤',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.favorite,
                    size: 150,
                    color: Colors.blue[100],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return favGridView;
  }
}

//Its FavoriteList Page. I changed the name
class EditFavorites extends StatefulWidget {
  @override
  _EditFavoritesState createState() => _EditFavoritesState();
}

class _EditFavoritesState extends State<EditFavorites> {
  final _editableFavorites = <int>{};

  @override
  void initState() {
    _editableFavorites.addAll(favorites);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Favorites!'),
        centerTitle: true,
        backgroundColor: Colors.red,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.done),
        //     onPressed: () {
        //       Navigator.pop<Set>(context, _editableFavorites);
        //     },
        //   )
        // ],
      ),
      //backgroundColor: Colors.indigo,
      body: SafeArea(
        child: ListView.builder(
          itemCount: nameOfSite.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: <Widget>[
                  Image.asset('lib/images/${images[index]}'),
                  SizedBox(
                    width: 30,
                  ),
                  Text(nameOfSite[index]),
                ],
              ),
              trailing: IconButton(
                icon: _editableFavorites.contains(index)
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                onPressed: () {
                  setState(() {
                    if (_editableFavorites.contains(index))
                      _editableFavorites.remove(index);
                    else
                      _editableFavorites.add(index);
                  });
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        foregroundColor: Colors.red,
        onPressed: () {
          Navigator.pop<Set>(context, _editableFavorites);
        },
      ),
    );
  }
}
