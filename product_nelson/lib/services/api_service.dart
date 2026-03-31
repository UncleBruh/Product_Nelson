import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getallProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => Product(
          id: item['id'].toString(),
          title: item['title'],
          price: item['price'].toDouble(),
          category: item['category'],
          image: item['image'],
          rating: item['rating']['rate'].toString(),
        )).toList();
      } else {
        throw Exception('gagal mengambil data');
      }
    } catch (e) {
      throw Exception('gagal mengambil data');
    }
  }
}
