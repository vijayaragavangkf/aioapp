import 'package:flutter/material.dart';
import 'lists.dart';
import 'secondtab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GridView',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('AIO'),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.favorite)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          gridView,
          SecondPage(),
        ],
      ),
    );
  }
}

// Scaffold(
//       drawer: Drawer(),
//       backgroundColor: Theme.of(context).primaryColor,
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             pinned: true,
//             expandedHeight: 200,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(
//                 'AIO',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               centerTitle: true,
//             ),
//           ),
//           gridView,
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Search',
//         child: Icon(Icons.search),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//       ),
//     );
