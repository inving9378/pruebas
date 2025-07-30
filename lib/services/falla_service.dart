import 'package:http/http.dart' as http;

class FallaService {
  static const String baseUrl = 'http://tu-servidor/api';

  static Future<bool> reportarFalla(String token, String mensaje) async {
    final response = await http.post(
      Uri.parse('\$baseUrl/cliente/reportar-falla'),
      headers: {
        'Authorization': 'Bearer \$token',
        'Accept': 'application/json'
      },
      body: {
        'mensaje': mensaje,
      },
    );

    return response.statusCode == 200;
  }
}
