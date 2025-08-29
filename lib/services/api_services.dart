import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "http://192.168.137.1:8000/api/anggota";

  Future<Map<String, dynamic>> login(String nomorAnggota, String password) async {
    final url = Uri.parse("$baseUrl/login/");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nomor_anggota": nomorAnggota,
        "password": password,
      }),
    );

    return jsonDecode(response.body);
  }
}
