class Category{
  late int id;
  late String title;
  late String image;

  Category({
    required this.id,
    required this.title,
    required this.image,
 });
  Category.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }
}