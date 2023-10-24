class BeritaModel {
  final String id;
  final String judul;
  final String gambar;
  final String isi;

BeritaModel(this.id, this.judul, this.gambar, this.isi);

factory BeritaModel.fromJson (Map<String, dynamic> json){
  return BeritaModel(json['id'], json['judul'], json['gambar'], json['isi']);
}
}

