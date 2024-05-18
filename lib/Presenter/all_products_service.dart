import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:store_application/Model/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      Iterable data = jsonDecode(response.body);
      return List<ProductModel>.from(data.map((model) => ProductModel.fromJson(model)));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
