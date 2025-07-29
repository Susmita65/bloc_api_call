import 'package:new_bloc_api_practice/features/get_products/data/models/product_model.dart';
import 'package:new_bloc_api_practice/features/get_products/domain/repo/get_products_repo.dart';

class GetProductsUseCase {
  final GetProductsRepo repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductModel>> call({int limit = 30, int skip = 0}) async {
    return repository.getProducts(limit, skip);
  }

  Future<ProductModel> callProductDetails({int productId = 0}) async {
    return repository.getProductsDetails(productId);
  }
}
