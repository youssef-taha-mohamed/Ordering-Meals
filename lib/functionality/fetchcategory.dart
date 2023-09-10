import 'dart:convert';
import 'package:http/http.dart' as htt;
import '../models/category.dart';

Future <List<Category>> fetchCategory() async {
  const url = "https://fackfoodapi.onrender.com/categories";
  final response = await htt.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List jsonDecode = json.decode(response.body);
    return jsonDecode.map((index) {
      return Category.fromJson(index);
    }).toList();
  } else {
    throw Exception("hello");
  }
}
