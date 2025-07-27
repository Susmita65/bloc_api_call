part of 'getproducts_bloc.dart';

@immutable
sealed class GetproductsEvent {}

final class GetAllProductsEvent extends GetproductsEvent {}

final class SelectProductsEvent extends GetproductsEvent {
  final int selctedProductId;
  SelectProductsEvent({required this.selctedProductId});
}
