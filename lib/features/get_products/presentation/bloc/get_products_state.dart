part of 'get_products_bloc.dart';

enum FetchProductsStatus { initial, loading, success, error }

class GetProductsState extends Equatable {
  final List<ProductModel> product; //getproducts ko lagi
  final ProductModel? productDetails; //productDetails ko lagi
  final FetchProductsStatus status;
  final int productID;

  const GetProductsState({
    this.product = const [],
    this.status = FetchProductsStatus.initial,
    this.productID = 0,
    this.productDetails,
  });

  GetProductsState copyWith({
    List<ProductModel>? product,
    FetchProductsStatus? status,
    int? productID,
    ProductModel? productDetails,
  }) {
    return GetProductsState(
      product: product ?? this.product,
      status: status ?? this.status,
      productID: productID ?? this.productID,
      productDetails: productDetails ?? this.productDetails,
    );
  }

  @override
  List<Object?> get props => [product, status, productID, productDetails];
}
