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
  List<BeritaModel> listBerita = [];
  void getBerita() async {
    listBerita = await Repository().getBerita();
    setState(() {});
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
      body: 
      Column(
        children: [
          Text('Berita'),
          Expanded(
            child: ListView.builder(
              itemCount: listBerita.length,
              itemBuilder: (context, index) {
                final berita = listBerita[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(
                          10.0), // Sesuaikan radius sesuai kebutuhan
                    ),
                    child:
                     Column(
                      children: [
                        Text(
                          berita.judul,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0, 
                            
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              20.0), // Sesuaikan radius sesuai kebutuhan
                          child: SizedBox(
                            width: double
                                .infinity, // Sesuaikan lebar sesuai kebutuhan
                            height: 200, // Sesuaikan tinggi sesuai kebutuhan
                            child: Image.network(
                              berita.gambar,
                              fit: BoxFit
                                  .cover, // Menyesuaikan gambar ke kotak yang diberikan
                            ),
                          ),
                        ),
                        Text(berita.isi),
                      ],
                    ),
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
