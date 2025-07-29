part of 'get_products_bloc.dart';

@immutable
sealed class GetAllProductsEvent extends Equatable {}

final class GetProductsEvent extends GetAllProductsEvent {
  @override
  List<Object?> get props => [];
}

final class UpdateProductIDEvent extends GetAllProductsEvent {
  final int productID;
  UpdateProductIDEvent({this.productID = 0});

  @override
  List<Object?> get props => [productID];
}

final class GetProductsDetailEvent extends GetAllProductsEvent {
  GetProductsDetailEvent();
  @override
  List<Object?> get props => [];
}
