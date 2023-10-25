import 'package:flutter/material.dart';
import 'package:pemesanan_tiket_pemancingan/Views/berita.dart';
import 'package:pemesanan_tiket_pemancingan/Views/jadwal_tiket.dart';
import 'package:pemesanan_tiket_pemancingan/Views/tiket.dart';
import 'Views/splashscreen.dart';
import 'Views/homepage.dart';
import 'Views/jadwal_tiket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemesanan Tiket Pemancingan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => Splash(),
        '/home': (context) => MyHomePage(),
        '/berita':(context) => Berita(),
        '/tiket':(context) => Tiket(),
        '/jadwal_tiket': (context) => Jadwaltiket(),
      },
    );
  }
}



