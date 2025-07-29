import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:new_bloc_api_practice/features/get_products/data/models/product_model.dart';
import 'package:new_bloc_api_practice/features/get_products/domain/usecases/get_products_usecase.dart';
part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetAllProductsEvent, GetProductsState> {
  final GetProductsUseCase getproductsUseCase;
  final GetProductsUseCase getproductsDetailsUsecase;

  GetProductsBloc({
    required this.getproductsUseCase,
    required this.getproductsDetailsUsecase,
  }) : super(GetProductsState()) {
    on<GetProductsEvent>(_onGetProductsEvent);
    on<GetProductsDetailEvent>(_onGetProductsDetailsEvent);
    on<UpdateProductIDEvent>(_onUpdateProductID);
  }
  FutureOr<void> _onGetProductsEvent(
    GetProductsEvent event,
    Emitter<GetProductsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FetchProductsStatus.loading));
      final getProducts = await getproductsUseCase();
      emit(
        state.copyWith(
          product: getProducts,
          status: FetchProductsStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FetchProductsStatus.error));
    }
  }

  FutureOr<void> _onUpdateProductID(
    UpdateProductIDEvent event,
    Emitter<GetProductsState> emit,
  ) {
    emit(state.copyWith(productID: event.productID));
  }

  FutureOr<void> _onGetProductsDetailsEvent(
    GetProductsDetailEvent event,
    Emitter<GetProductsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FetchProductsStatus.loading));

      final productList = await getproductsDetailsUsecase();
      final product = productList.firstWhere(
        (product) => product.id == state.productID,
      ); //yesma list aeraxa
      emit(
        state.copyWith(
          productID: state.productID,
          productDetails: product,
          status: FetchProductsStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FetchProductsStatus.error));
    }
  }
}
