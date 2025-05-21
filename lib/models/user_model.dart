class User {
  final String id;
  final String nama;
  final String nip;
  final String alamat;
  final String noHp;

  User({
    required this.id,
    required this.nama,
    required this.nip,
    required this.alamat,
    required this.noHp,
  });

  // Untuk parsing dari JSON ke object User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      nama: json['nama'] ?? '',
      nip: json['nip'] ?? '',
      alamat: json['alamat'] ?? '',
      noHp: json['no_hp'] ?? '',
    );
  }

  // Untuk mengubah object User ke JSON (kalau kamu butuh)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nip': nip,
      'alamat': alamat,
      'no_hp': noHp,
    };
  }
}
