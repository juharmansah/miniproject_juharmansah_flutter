import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pemesanan_tiket_pemancingan/Models/berita_model.dart';
import 'package:pemesanan_tiket_pemancingan/Models/kolam_model.dart';

class Repository {
  final baseUrl = 'https://65335062d80bd20280f66220.mockapi.io/';

  Future getBerita() async {
    final respons = await http.get(Uri.parse(baseUrl + 'berita'));
    if (respons.statusCode == 200) {
      List jsonData = jsonDecode(respons.body);
      List<BeritaModel> dataBerita =
          jsonData.map((e) => BeritaModel.fromJson(e)).toList();
      return dataBerita;
    }
    ;
  }

  Future getKolam() async {
    final respons = await http.get(Uri.parse(baseUrl + 'kolam'));
    if (respons.statusCode == 200) {
      List jsonData = jsonDecode(respons.body);
      List<KolamModel> dataKolam =
          jsonData.map((e) => KolamModel.fromJson(e)).toList();
      return dataKolam;
    }
    ;
  }

  Future putKolam(List bangku, String id) async {
    final listBangku = bangku.map((e) => e.toMap()).toList();

    final respons = await http.put(
      Uri.parse('${baseUrl}kolam/${id}'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {'bangku': listBangku},
      ),
    );

    if (respons.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
