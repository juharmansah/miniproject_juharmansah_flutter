import 'package:flutter/material.dart';
import 'package:pemesanan_tiket_pemancingan/Views/drawer.dart';

class Berita extends StatefulWidget {
  const Berita({super.key});

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {

  List listBerita = [
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Ayo, Memancing")),
        backgroundColor: Color(0xFF3CC56B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
        ),
      ),
      drawer: Dashboard(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("data"),

          ListView.builder(
            shrinkWrap: true,
            itemCount: listBerita.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                color: Colors.grey,
                child: Column(
                  children: [
                    Image.asset(''),
                    Text(''),
                  ],
                ),
              );
            },
          ),
          ],
        ),
      ),
    );
  }
}
