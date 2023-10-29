import 'package:flutter/material.dart';
import 'package:pemesanan_tiket_pemancingan/Models/bangku_model.dart';
import 'package:pemesanan_tiket_pemancingan/Models/kolam_model.dart';
import 'package:pemesanan_tiket_pemancingan/Views/drawer.dart';
import 'package:pemesanan_tiket_pemancingan/Views/jadwal_tiket.dart';

import '../ViewModels/repository.dart';

class Tiket extends StatefulWidget {
  const Tiket({super.key});

  @override
  State<Tiket> createState() => _TiketState();
}

class _TiketState extends State<Tiket> {
  List<KolamModel> listKolam = [
    // KolamModel(1, [BangkuModel(1, 'haloo', 'ada')], '1'),
    // KolamModel(2, [], '1'),
    // KolamModel(3, [], '1'),
  ];

  void getKolam() async {
    listKolam = await Repository().getKolam();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKolam();
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
      body: ListView.builder(
        itemCount: listKolam.length,
        itemBuilder: (context, index) {
          final kolam = listKolam[index];
          return Column(
            children: [
              Text('tiket kolam ${kolam.noKolam}'),
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey,
                child: Column(
                  children: [
                    Text('no bangku'),
                    Expanded(
                      child: Center(
                        child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Color warna = Colors.white;
                            bool terisi = false;
                            try {
                              if (kolam.bangku[index].status == 'ada') {
                                warna = Colors.green;
                                terisi = true;
                              }
                            } catch (e) {}
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 100,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: warna,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      if (!terisi) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Jadwaltiket(
                                                  model: kolam,
                                                  noBangku: index + 1),
                                            ));
                                      }
                                    },
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: Colors
                                            .black, 
                                        fontWeight: FontWeight
                                            .bold, 
                                        fontSize:
                                            18.0, 
                                      ),
                                    ),),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
