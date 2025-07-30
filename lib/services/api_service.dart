import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://tu-servidor/api';

  static Future<List<dynamic>> obtenerPromociones(String token) async {
    final response = await http.get(
      Uri.parse('\$baseUrl/cliente/promociones'),
      headers: {
        'Authorization': 'Bearer \$token',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener promociones');
    }
  }
}
