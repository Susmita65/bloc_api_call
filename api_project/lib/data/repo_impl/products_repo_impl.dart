import 'package:api_project/data/datasource/products_remote_datasource.dart';
import 'package:api_project/data/models/products_model.dart';
import 'package:api_project/domain/repo/products_repo.dart';

class ProductsRepoImpl implements ProductRepository {
  final ProductsRemoteDatasource productsRemoteDatasource;
  const ProductsRepoImpl({required this.productsRemoteDatasource});
  @override
  Future<List<Products>> getProducts() {
    return productsRemoteDatasource.fetchProducts();
  }
}
