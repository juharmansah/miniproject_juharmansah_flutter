import 'package:flutter/material.dart';
import 'package:pemesanan_tiket_pemancingan/Models/berita_model.dart';
import 'package:pemesanan_tiket_pemancingan/ViewModels/repository.dart';
import 'package:pemesanan_tiket_pemancingan/Views/drawer.dart';

class Berita extends StatefulWidget {
  const Berita({super.key});

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {

  List<BeritaModel> listBerita = [
    
  ];
  void getBerita()async{
    listBerita = await Repository().getBerita();
    setState(() {
      
    });
  }
  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBerita();
  }
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

      body: Column(
        children: [
          Text('Berita'),
  
        Expanded(
          child: ListView.builder(
            
            itemCount: listBerita.length,
            itemBuilder: (context, index) {
              final berita = listBerita[index];
              return Container(
                width: double.infinity,
                color: Colors.grey,
                child: Column(
                  children: [
                    Text(berita.judul),
                    Image.network(berita.gambar),
                    Text(berita.isi),
                  ],
                ),
              );
            },
          ),
        ),
        ],
      ),
    );
  }
}
