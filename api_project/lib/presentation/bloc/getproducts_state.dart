part of 'getproducts_bloc.dart';

@immutable
sealed class GetproductsState extends Equatable {
  const GetproductsState();
  @override
  List<Object> get props => [];
}

final class GetproductsInitial extends GetproductsState {}

final class GetproductsLoading extends GetproductsState {}

final class GetproductsLoaded extends GetproductsState {
  final List<Products> products;
  final int? selectedproductId;
  const GetproductsLoaded({required this.products, this.selectedproductId});

  //mathi garesi yo ya pani garnai parxa??
  @override
  List<Object> get props => [products];
}

final class GetproductsFailure extends GetproductsState {
  final String error;
  const GetproductsFailure({required this.error});
  @override
  List<Object> get props => [error];
}
