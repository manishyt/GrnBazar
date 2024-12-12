import 'dart:convert';

// Functions for JSON parsing and encoding
List<BaseProductModel> baseProductModelFromJson(String str) =>
    List<BaseProductModel>.from(
        json.decode(str).map((x) => BaseProductModel.fromJson(x)));

String baseProductModelToJson(List<BaseProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BaseProductModel {
  int id; // Added id field
  String name;
  double price;
  String image;
  String description;

  BaseProductModel({
    required this.id, // Added required id
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  // Factory constructor for creating a BaseProductModel from JSON
  factory BaseProductModel.fromJson(Map<String, dynamic> json) {
    return BaseProductModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      name: json["name"] ?? "",
      price: json["price"] != null
          ? (json["price"] is num
              ? (json["price"] as num).toDouble()
              : double.tryParse(json["price"].toString()) ?? 0.0)
          : 0.0,
      image: json["image"] ?? "",
      description: json["description"] ?? "",
    );
  }

  // Method for converting a BaseProductModel to JSON
  Map<String, dynamic> toJson() => {
        "id": id, // Include id in JSON output
        "name": name,
        "price": price,
        "image": image,
        "description": description,
      };
}
