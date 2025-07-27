import 'package:api_project/data/datasource/products_remote_datasource.dart';
import 'package:api_project/data/models/products_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'getproducts_event.dart';
part 'getproducts_state.dart';

final ProductsRemoteDatasource remoteDataSource = ProductsRemoteDatasource();

class GetproductsBloc extends Bloc<GetproductsEvent, GetproductsState> {
  GetproductsBloc() : super(GetproductsInitial()) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(GetproductsLoading());
      try {
        final model = await remoteDataSource.fetchProducts();
        emit(GetproductsLoaded(products: model));
      } catch (e) {
        emit(GetproductsFailure(error: 'Failed to load products'));
      }
    });

    on<SelectProductsEvent>((event, emit) {
      final currentState = state;
      if (currentState is GetproductsLoaded) {
        emit(
          GetproductsLoaded(
            products: currentState.products,
            selectedproductId: event.selctedProductId,
          ),
        );
      }
    });
  }
}
