import 'dart:convert';

import 'package:lesson_14/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsProvider {
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    final list = jsonDecode(response.body)['products'] as List;

    return list.map((json) => Product.fromJson(json)).toList();
  }
}