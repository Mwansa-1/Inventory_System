import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<Map<String, dynamic>> fetchProduct(String barcode) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$barcode'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<void> addProduct(String name, int quantity, String barcode) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'quantity': quantity,
        'barcode': barcode,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add product');
    }
  }
}
