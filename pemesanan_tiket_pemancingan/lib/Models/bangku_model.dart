class BangkuModel {
  final int noBangku;
  final String nama;
  final String status;


BangkuModel(this.noBangku, this.nama, this.status);

factory BangkuModel.fromJson(Map<String, dynamic> json){
  return BangkuModel(json['noBangku'], json['nama'], json['status'],);

}

  Map toMap(){
    return {
      'noBangku' : noBangku, 'nama' : nama, 'status' : status
    };
  }
}