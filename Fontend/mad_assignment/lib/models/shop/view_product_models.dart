import 'dart:convert';

class ViewProductModel {
  // int id;
  String name;
  double price;
  String image;
  String description;

  ViewProductModel({
    // required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  // From JSON to ProductModel
  factory ViewProductModel.fromJson(Map<String, dynamic> json) {
    return ViewProductModel(
      // id: int.tryParse(json['id'].toString()) ?? 0,
      name: json["name"] ?? "",
      price: json["price"] != null ? json["price"].toDouble() : 0.0,
      image: json["image"] ?? "",
      description: json["description"] ?? "",
    );
  }

  // Convert ProductModel to JSON
  Map<String, dynamic> toJson() => {
        // "id": id,
        "name": name,
        "price": price,
        "image": image,
        "description": description,
      };
}
