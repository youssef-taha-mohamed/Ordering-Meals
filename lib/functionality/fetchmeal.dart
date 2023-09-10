
import 'dart:convert';
import '../models/meal.dart';
import 'package:http/http.dart' as htt;
Future <List<Meal>> fetchMeal() async{
  const url = "https://fackfoodapi.onrender.com/foods";
  final response =await htt.get(Uri.parse(url));
  if(response.statusCode == 200){
    List jsonDecode = json.decode(response.body);
    return jsonDecode.map((index) {
      return Meal.fromJson(index);
    }).toList();
  }else{
    throw Exception("False");
  }
}



