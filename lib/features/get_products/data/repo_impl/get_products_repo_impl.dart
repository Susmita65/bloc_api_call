import 'dart:io';

import 'package:new_bloc_api_practice/features/get_products/data/datasource/products_remote_datasource.dart';
import 'package:new_bloc_api_practice/features/get_products/data/models/product_model.dart';
import 'package:new_bloc_api_practice/features/get_products/domain/repo/get_products_repo.dart';

class GetProductsRepoImpl extends GetProductsRepo {
  final ProductsRemoteDatasource productsRemoteDatasource;
  GetProductsRepoImpl(this.productsRemoteDatasource);
  @override
  Future<List<ProductModel>> getProducts(int limit, int skip) {
    return productsRemoteDatasource.fetchProducts(limit, skip);
  }

  @override
  Future<ProductModel> getProductsDetails(int productId) {
    return productsRemoteDatasource.fetchProductsDetails(productId);
  }
}
