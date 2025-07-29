import 'package:new_bloc_api_practice/features/get_products/data/models/reviews.dart';
import 'package:new_bloc_api_practice/features/get_products/domain/entities/products.dart';

class ProductModel extends Products {
  ProductModel({
    required int id,
    required String title,
    required String thumbnail,
    required num price,
    required String description,
    required List<Reviews>? reviews,
  }) : super(
         id: id,
         title: title,
         thumbnail: thumbnail,
         price: price,
         description: description,
         reviews: reviews,
       );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'],
      description: json['description'],

      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Reviews.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'price': price,
      'description': description,

      'reviews': reviews,
    };
  }
}
