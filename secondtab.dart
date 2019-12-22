// import 'package:flutter/material.dart';
// import 'favoritelist.dart';

// final Set saved = Set(); //location of 'saved' Set changed from the 'favoritelist.dart' to here!

// List favorites = List();

// class SecondPage extends StatefulWidget {
//   @override
//   _SecondPageState createState() => _SecondPageState();
// }

// class _SecondPageState extends State<SecondPage> {
//   @override
//   Widget build(BuildContext context) {
//     return //return - favorite list if any item is checked, if not then just return container and a FAB!
//      Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         // ListView.builder(
//         //   itemCount: saved.length,
//         //   itemBuilder: (context, index){
//         //     return ListTile(
//         //       title: Row(
//         //         children: <Widget>[
//         //           Image.asset('lib/images/${saved[index]}' //this is not working but i need 
//         //             this to make it exactly like the items select screen! and also the Text(saved[index]) not working. Same Case!
//         //         ],
//         //       ),
//         //     );
//         //   },
//         // ),
//         Text(
//           'Add Your Favorite Sites Here!❤',
//           style: TextStyle(color: Colors.white),
//         ),
//         Container(
//           child: Icon(Icons.favorite, size: 150, color: Colors.blue[100]),
//         ),
//         SizedBox(height: 250),
//         FloatingActionButton(
//           onPressed: () async{
//             Set newSet = await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => FavoriteList(),
//               ),
//             );
//             setState(() {
//               favorites = newSet.toList();
//             });
//             print(newSet);
//           },
//           child: Icon(Icons.add),
//           foregroundColor: Colors.blue,
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:aioapp2/lists.dart';

Set<int> favorites = {};

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
                Icons.edit,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditFavorites(),
                  ),
                ).then((updatedFavorites) {
                  if (updatedFavorites != null)
                    setState(() {
                      favorites = updatedFavorites;
                    });
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
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/images/${images[index]}'),
          ),
          title: Text(nameOfSite[favorites.elementAt(index)]),
        );
      },
    );
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.pop<Set>(context, _editableFavorites);
            },
          )
        ],
      ),
      //backgroundColor: Colors.indigo,
      body: SafeArea(
        child: ListView.builder(
          itemCount: nameOfSite.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('lib/images/${images[index]}'),
              ),
              title: Text(nameOfSite[index]),
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
    );
  }
}
