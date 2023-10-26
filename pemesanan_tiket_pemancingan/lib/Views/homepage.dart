// import 'package:flutter/material.dart';
// import 'package:pemesanan_tiket_pemancingan/Views/drawer.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class MyHomePage extends StatelessWidget {
//   final List<String> images = [
//     'https://placekitten.com/200/200',
//     'https://placekitten.com/201/201',
//     'https://placekitten.com/202/202',
//     'https://placekitten.com/203/203',
//     // Add more image URLs as needed
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Ayo, Memancing")),
//         backgroundColor: Color(0xFF3CC56B),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(30.0),
//           ),
//         ),
//       ),
//       drawer: Dashboard(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 30),
//             child: Text("Berita"),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 40),
//             decoration: BoxDecoration(
//                 color: Colors.grey, borderRadius: BorderRadius.circular(30)),
//             child: Column(
//               children: [
//                 Text("judul"),
//                 CarouselSlider(
//                   options: CarouselOptions(
//                     height: 250.0,
//                     enlargeCenterPage: true,
//                     autoPlay: true,
//                     aspectRatio: 16 / 9,
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     enableInfiniteScroll: true,
//                     autoPlayAnimationDuration: Duration(milliseconds: 800),
//                     viewportFraction: 0.8,
//                   ),
//                   items: images
//                       .map((item) => Container(
//                             child: Center(
//                               child: Image.network(
//                                 item,
//                                 fit: BoxFit.cover,
//                                 width: 1000,
//                               ),
//                             ),
//                           ))
//                       .toList(),
//                 ),
//                 Text("deskripsi"),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 40),
//             child: Text("Tiket"),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 40),
//             child: Text("deskripsi"),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               MaterialButton(
                    
//                     height: 100,
//                     minWidth: 100,
//                     color: Colors.amber,
//                     onPressed: () {},
//                     child: Image.asset("assets/1.png", width: 50,)),
              
//               MaterialButton(
//                   height: 100,
//                   minWidth: 100,
//                   color: Colors.amber,
//                   onPressed: () {},
//                   child: Image.asset("assets/2.png", width: 50,)),
                  
//               MaterialButton( 
//                   height: 100,
//                   minWidth: 100,
//                   color: Colors.amber,
//                   onPressed: () {},
//                   child: Image.asset("assets/3.png", width: 50,)),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
