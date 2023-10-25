import 'package:pemesanan_tiket_pemancingan/Models/bangku_model.dart';

class KolamModel {
  final String id;
  final int noKolam;
  final List bangku;

  KolamModel(this.id, this.noKolam, this.bangku);

  factory KolamModel.fromJson(Map<String, dynamic> json) {
    List listBangku = json["bangku"].map((e) => BangkuModel.fromJson(e)).toList();
    print(listBangku);
    return KolamModel(
      json['id'],
      json['no_kolam'],
      listBangku
    );
  }
}

// class KolamModel {
//   final String id;
//   final List<BangkuModel> bangku;

//   KolamModel({required this.id, required this.bangku});

//   factory KolamModel.fromJson(Map<String, dynamic> json) {
//     return KolamModel(
//       id: json['id'],
//       bangku: (json['bangku'] as List<dynamic>).map((e) => BangkuModel.fromJson(e)).toList(),
//     );
//   }
// }

// class BangkuModel {
//   final int no;
//   final String nama;
//   final String status;

//   BangkuModel({required this.no, required this.nama, required this.status});

//   factory BangkuModel.fromJson(Map<String, dynamic> json) {
//     return BangkuModel(
//       no: json['no'],
//       nama: json['nama'],
//       status: json['status'],
//     );
//   }
// }
