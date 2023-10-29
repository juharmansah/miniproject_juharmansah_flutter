import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pemesanan_tiket_pemancingan/ViewModels/login_tes.dart';
import 'package:pemesanan_tiket_pemancingan/Views/berita.dart';
import 'package:pemesanan_tiket_pemancingan/Views/chatbot.dart';
import 'package:pemesanan_tiket_pemancingan/Views/daftar.dart';
import 'package:pemesanan_tiket_pemancingan/Views/jadwal_tiket.dart';
import 'package:pemesanan_tiket_pemancingan/Views/login.dart';
import 'package:pemesanan_tiket_pemancingan/Views/struk_tiket.dart';
import 'package:pemesanan_tiket_pemancingan/Views/tiket.dart';
import 'Views/profil.dart';
import 'Views/splashscreen.dart';
import 'Views/jadwal_tiket.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pemesanan Tiket Pemancingan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => Splash(),
        '/login': (context) => LoginPage(),
        '/daftar': (context) => Daftar(),
        '/profil': (context) => ProfilePage(),
        '/berita':(context) => Berita(),
        '/tiket':(context) => Tiket(),
        '/struk':(context) => SuccessPage(),
        '/chatbot': (context) => ChatBotScreen(),
        
      },
    );
  }
}



