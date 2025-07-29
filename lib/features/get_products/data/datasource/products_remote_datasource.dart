import 'package:dio/dio.dart';
import 'package:new_bloc_api_practice/features/get_products/data/models/product_model.dart';

class ProductsRemoteDatasource {
  final dio = Dio();
  String baseUrl = 'https://dummyjson.com';
  String endpoint = '/products';
  Future<List<ProductModel>> fetchProducts(int limit, int skip) async {
    var result =
        <
          ProductModel
        >[]; // yesma list aauxa ani tyo list chai display garnaune dasboard screen ma
    try {
      final response = await dio.get('$baseUrl$endpoint');
      if (response.statusCode == 200) {
        print("Sushmita $response");
        final results = response.data;
        final List<dynamic> list = results['products'] ?? [];
        print("List of the products :$list");
        for (var item in list) {
          final product = ProductModel.fromJson(item);
          result.add(product);
        }

        return result;
      } else {
        print("Hello Error");
        throw Exception("Failed to load products data");
      }
    } catch (e, stackTrace) {
      print("StackTrace:$stackTrace");
      throw Exception("$e");
    }
  }

  //function for getProductDetailsApi
  Future<ProductModel> fetchProductsDetails(int productId) async {
    try {
      final response = await dio.get(
        '$baseUrl$endpoint/$productId',
      ); //yesma euta product ko details matra chainxa so euta object matra
      if (response.statusCode == 200) {
        final data = response.data;
        return ProductModel.fromJson(data);
      } else {
        throw Exception('Failed to load product details');
      }
    } catch (e, stackTrace) {
      print("StackTrace:$stackTrace");
      throw Exception("$e");
    }
  }
}

//yedi list ma xa vane pani teslai list ma transform garna parxa
