import 'package:new_bloc_api_practice/features/get_products/data/models/product_model.dart';

abstract class GetProductsRepo {
  Future<List<ProductModel>> getProducts(int limit, int skip);
  Future<ProductModel> getProductsDetails(int productId);
}
