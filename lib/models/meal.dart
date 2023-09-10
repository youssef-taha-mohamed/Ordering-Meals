class Meal{
  late int id;
  late String title;
  late String type;
  late int price;
  late String description;
  late String shop;
  late String image;

  Meal({
    required this.id,
    required this.title,
    required this.type,
    required this.price,
    required this.description,
    required this.shop,
    required this.image,
});
  Meal.fromJson(Map<String, dynamic> json2){
    id = json2["id"];
    title = json2["title"];
    type = json2["type"];
    price = json2["price"];
    description = json2["description"];
    shop = json2["shop"];
    image = json2["image"];
  }
}