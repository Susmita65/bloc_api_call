import 'package:new_bloc_api_practice/features/get_products/data/models/reviews.dart';

class Products {
  final int id;
  final String title;
  final String? description;
  final String thumbnail;
  final num price;
  final List<Reviews>? reviews;
  const Products({
    required this.id,
    required this.title,
    required this.price,
    this.description,
    required this.thumbnail,
    this.reviews,
  });
}
