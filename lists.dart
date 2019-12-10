// import 'package:webview_flutter/webview_flutter.dart';

// import 'package:aioapp/webpage.dart';
// import 'package:flutter/material.dart';

import 'package:aioapp2/webpage.dart';
import 'package:flutter/material.dart';

List images = [
  'image1.png',
  'image2.png',
  'image3.png',
  'image4.png',
  'image5.png',
  'image6.png',
  'image7.png',
  'image8.png',
  'image9.png',
  'image10.png',
  'image11.png',
  'image12.png',
  'image13.png',
  'image14.png',
  'image15.png',
  'image16.png',
  'image17.png',
  'image18.png',
  'image19.png',
  'image20.png',
  'image21.png',
  'image22.png',
  'image23.png',
  'image24.png',
  'image25.png',
  'image26.png',
  'image27.png',
  'image28.png',
  'image29.png',
  'image30.png',
  'image32.png',
  'image33.png',
  'image34.png',
  'image35.png',
  'image36.png',
  'image37.png',
  'image38.png',
  'image39.png',
  'image40.png',
  'image41.png',
  'image42.png',
  'image43.png',
  'image44.png',
  'image45.png',
  'image46.png',
  'image47.png',
  'image48.png',
  'image49.png',
  'image50.png',
  'image51.png',
  'image52.png',
  'image53.png',
  'image54.png',
];

List nameOfSite = [
  'Amazon',
  'Bing',
  'Blogger',
  'eBay',
  'Facebook',
  'Gmail',
  'Google',
  'Instagram',
  'LinkedIn',
  'Netflix',
  'Pinterest',
  'YouTube',
  'Tumblr',
  'Twitter',
  'Vine',
  'Myntra',
  'Ajio',
  'Flipkart',
  'Twitch',
  'VK',
  'Alibaba',
  'Quora',
  'Swiggy',
  'Zomato',
  'Reddit',
  'JioSaavn',
  'Spotify',
  'Google Maps',
  'AliExpress',
  'Medium',
  'Dailymotion',
  'Wikipedia',
  'TED',
  'Wattpad',
  'cricbuzz',
  'IMDb',
  'Hotstar',
  'TVFPlay',
  'GitHub',
  'y2mate',
  'Flipboard',
  'InShorts',
  'OLX',
  'Paytm',
  'PayPal',
  'Ola',
  'Uber',
  'Best Hashtags',
  'Yahoo Mail',
  'Accuweather',
  'Udemy',
  'Udacity',
  'Skillshare'
];

List<String> yashjha = <String>[
  'https://www.amazon.com/',
  'https://www.bing.com/',
  'https://www.blogger.com/',
  'https://www.ebay.com/',
  'https://www.facebook.com/',
  'https://mail.google.com/',
  'https://www.google.com/',
  'https://www.instagram.com/',
  'https://www.linkedin.com/',
  'https://www.netflix.com/',
  'https://www.pinterest.com/',
  'https://www.youtube.com/',
  'https://www.tumblr.com/',
  'https://twitter.com/',
  'https://vine.co/',
  'https://www.myntra.com/',
  'https://www.ajio.com/',
  'https://www.flipkart.com/',
  'https://www.twitch.tv/',
  'https://vk.com/',
  'https://www.alibaba.com/',
  'https://www.quora.com/',
  'https://www.swiggy.com/',
  'https://www.zomato.com/',
  'https://www.reddit.com/',
  'https://www.jiosaavn.com/',
  'https://www.spotify.com/',
  'https://maps.google.com',
  'https://www.aliexpress.com/',
  'https://medium.com/',
  'https://www.dailymotion.com/',
  'https://www.wikipedia.org/',
  'https://www.ted.com/',
  'https://www.wattpad.com/',
  'https://www.cricbuzz.com/',
  'https://www.imdb.com/',
  'https://www.hotstar.com/',
  'https://tvfplay.com/',
  'https://github.com/',
  'https://www.y2mate.com/',
  'https://flipboard.com/',
  'https://inshorts.com/',
  'https://www.olx.com/',
  'https://paytm.com/',
  'https://www.paypal.com/',
  'https://www.olacabs.com/',
  'https://www.uber.com/',
  'https://www.tagsfinder.com/',
  'https://login.yahoo.com/',
  'https://www.accuweather.com/',
  'https://www.udemy.com/',
  'https://www.udacity.com/',
  'https://www.skillshare.com/'
];

var gridView = GridView.builder(
    itemCount: 53,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        child: Card(
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Image.asset('lib/images/${images[index]}'),
                  // child: SizedBox(child: Text('yashjha'),),
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage('lib/images/${images[index]}'),
                  //     fit: BoxFit.fitWidth,
                  //     alignment: Alignment.topCenter,
                  //   ),
                  // ),
                ),
              ),
              Text(nameOfSite[index]),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WebPage(yashjha[index])),
          );
        },
      );
    });

//   var gridView = SliverGrid(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 3,
//   ),
//   delegate: SliverChildBuilderDelegate(
//     (BuildContext context, int index) {
//       return InkWell(
//         child: Card(
//           elevation: 10,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Container(
//                   child: Image.asset('lib/images/${images[index]}'),
//                   // child: SizedBox(child: Text('yashjha'),),
//                   // decoration: BoxDecoration(
//                   //   image: DecorationImage(
//                   //     image: AssetImage('lib/images/${images[index]}'),
//                   //     fit: BoxFit.fitWidth,
//                   //     alignment: Alignment.topCenter,
//                   //   ),
//                   // ),
//                 ),
//               ),
//               Text(nameOfSite[index]),
//             ],
//           ),
//         ),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => WebPage(yashjha[index])),
//           );
//         },
//       );
//     },
//     childCount: 53,
//   ),
// );


var favGridView = GridView.builder(
    itemCount: 53,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        child: Card(
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Image.asset('lib/images/${images[index]}'),
                  // child: SizedBox(child: Text('yashjha'),),
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage('lib/images/${images[index]}'),
                  //     fit: BoxFit.fitWidth,
                  //     alignment: Alignment.topCenter,
                  //   ),
                  // ),
                ),
              ),
              Text(nameOfSite[index]),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WebPage(yashjha[index])),
          );
        },
      );
    });