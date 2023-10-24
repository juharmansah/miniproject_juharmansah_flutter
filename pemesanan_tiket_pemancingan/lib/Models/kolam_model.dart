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
