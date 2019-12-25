import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lists.dart';
import 'secondtab.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.getStringList("favorites")?.forEach((fav){
    favorites.add(int.tryParse(fav));
  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(),
          backgroundColor: Colors.blueAccent,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text('AIO'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.favorite)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              gridView,
              SecondPage(),
            ],
          ),
        ),
      ),
    );
  }
}
