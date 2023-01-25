class JadwalSholatModel {
  String? id;
  String? lokasi;

  JadwalSholatModel({this.id, this.lokasi});

  factory JadwalSholatModel.fromJson(Map<String, dynamic> object) {
    return JadwalSholatModel(id: object['id'], lokasi: object['lokasi']);
  }
}
