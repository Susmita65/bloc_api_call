import 'package:api_project/data/models/products_model.dart';
import 'package:dio/dio.dart';

class ProductsRemoteDatasource {
  final dio = Dio();
  String baseUrl = 'https://dummyjson.com';
  String endpoint = '/products';
  Future<List<Products>> fetchProducts() async {
    try {
      final response = await dio.get('$baseUrl$endpoint');
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['products'];

        return results
            .map((json) => Products.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Products cannot be loaded");
    }
  }
}

//yedi list ma xa vane pani teslai list ma transform garna parxa
