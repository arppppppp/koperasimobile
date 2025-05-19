import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:koperasi/models/user_model.dart';

class ApiService {
  // Ganti IP ini dengan IP lokal kamu jika pakai device fisik
  static const String baseUrl = 'http://10.11.13.47/koperasi_api';

  // Ambil semua user
  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/get_users.php'));

      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  // Tambah user
  static Future<bool> addUser(String name, String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/add_user.php'),
        body: {
          'name': name,
          'email': email,
        },
      );

      return response.statusCode == 200 && response.body.contains('success');
    } catch (e) {
      return false;
    }
  }

  // Hapus user
  static Future<bool> deleteUser(String id) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/delete_user.php'),
        body: {
          'id': id,
        },
      );

      return response.statusCode == 200 && response.body.contains('success');
    } catch (e) {
      return false;
    }
  }
}
