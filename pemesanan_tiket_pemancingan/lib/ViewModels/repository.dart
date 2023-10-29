import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:pemesanan_tiket_pemancingan/Models/berita_model.dart';
import 'package:pemesanan_tiket_pemancingan/Models/kolam_model.dart';
import 'package:pemesanan_tiket_pemancingan/Models/user_model.dart';
import 'package:pemesanan_tiket_pemancingan/Views/berita.dart';
import 'package:pemesanan_tiket_pemancingan/Models/bangku_model.dart';

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
    print(listBangku);

    final respons = await http.put(
      Uri.parse('${baseUrl}kolam/${id}'),
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

class FirebaseRepository {
  final _db = FirebaseFirestore.instance;
  Future<UserModel?> getUser(String username, String password) async {
    final snapshot = await _db
        .collection("users")
        .where("username", isEqualTo: username)
        .where("password", isEqualTo: password)
        .get();
        
    UserModel? userData = snapshot.docs.isEmpty
        ? null
        : snapshot.docs.map((e) => UserModel.fromSnapshot(e)).first;
    return userData;
  }
  
}


