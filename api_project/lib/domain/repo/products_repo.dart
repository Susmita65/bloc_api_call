import 'package:api_project/data/models/products_model.dart';

abstract class ProductRepository {
  Future<List<Products>> getProducts();
}
