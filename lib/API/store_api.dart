import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_34/Models/store_model.dart';

class ApiService {
  static Future<List<TabelModel>> getCats() async {
    final url = Uri.parse(
        "https://fakestoreapi.com/products");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => TabelModel.fromJson(json)).toList();
    } else {
      throw Exception("Gagal memuat data produk");
    }
  }
}
