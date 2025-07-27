import 'package:api_project/data/models/products_model.dart';
import 'package:api_project/domain/repo/products_repo.dart';

class GetProductsUsecase {
  final ProductRepository repository;
  const GetProductsUsecase({required this.repository});

  Future<List<Products>> call() async {
    return await repository.getProducts();
  }
}
