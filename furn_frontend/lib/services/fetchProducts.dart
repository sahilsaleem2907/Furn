import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Product.dart';

// Fetch our Products from API
Future<List<Product>> fetchProducts() async {
  List<Product> list;
  String link = "https://9d9e-202-164-138-65.ngrok.io/data";
  var res = await http
      .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var rest = json.decode(res.body) as List;
    list = rest.map<Product>((json) => Product.fromJson(json)).toList();
    return list;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
