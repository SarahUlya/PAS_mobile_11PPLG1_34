import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

// List<TabelModel> tabelModelFromJson(String str) =>
//     List<TabelModel>.from(json.decode(str).map((x) => TabelModel.fromJson(x)));

// String tabelModelToJson(List<TabelModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TabelModel {
  String id;
  String title;
  double price;
  String description;
  Category category;
  String image;
  Rating rating;

  RxBool isFavorite;
  String username;

  TabelModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    RxBool? isFavorite,
    required this.username,
  }) : isFavorite = isFavorite ?? false.obs;

  factory TabelModel.fromJson(Map<String, dynamic> json) => TabelModel(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: categoryValues.map[json["category"]]!,
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
    isFavorite: ((json["isFavorite"] ?? false) as bool).obs,
    username: json['username'] ?? '',
  );

  factory TabelModel.fromDb(Map<String, dynamic> data, String currentUsername) {
    return TabelModel(
      id: data['id'],
      title: data['title'],
      price: data['price'],
      description: data['description'],
      category: data['category'],
      image: data['image'],
      rating: data['rating'],
      isFavorite: (data['username'] == currentUsername).obs,
      username: data['username'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse[category],
    "image": image,
    "rating": rating.toJson(),
  };
}

enum Category { ELECTRONICS, JEWELERY, MEN_S_CLOTHING, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING,
});

class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(rate: json["rate"]?.toDouble(), count: json["count"]);

  Map<String, dynamic> toJson() => {"rate": rate, "count": count};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
