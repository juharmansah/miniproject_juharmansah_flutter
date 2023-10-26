import 'package:flutter/material.dart';
import 'package:pemesanan_tiket_pemancingan/Models/bangku_model.dart';
import 'package:pemesanan_tiket_pemancingan/Models/kolam_model.dart';
import 'package:pemesanan_tiket_pemancingan/ViewModels/repository.dart';
import 'package:pemesanan_tiket_pemancingan/Views/drawer.dart';

class Jadwaltiket extends StatefulWidget {
  final KolamModel model;
  final int noBangku;
  const Jadwaltiket({super.key, required this.model, required this.noBangku});

  @override
  State<Jadwaltiket> createState() => _JadwaltiketState();
}

class _JadwaltiketState extends State<Jadwaltiket> {

  final namaController = TextEditingController();
  void pesan () async {
   List listBangku = widget.model.bangku;
   final bangku = BangkuModel(widget.noBangku, namaController.text, 'kosong');
   listBangku.add(bangku);
   final respons = await Repository().putKolam(listBangku, widget.model.id);
   if (respons){
print('berhasil');
   }
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
         
          TextField(
            decoration: InputDecoration(
              labelText: 'nama',
            ),
          ),
          ElevatedButton(
            onPressed: pesan,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
