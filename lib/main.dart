import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_bloc_api_practice/core/config/routing/route_config.dart';
import 'package:new_bloc_api_practice/features/get_products/data/datasource/products_remote_datasource.dart';
import 'package:new_bloc_api_practice/features/get_products/data/repo_impl/get_products_repo_impl.dart';
import 'package:new_bloc_api_practice/features/get_products/domain/usecases/get_products_usecase.dart';
import 'package:new_bloc_api_practice/features/get_products/presentation/bloc/get_products_bloc.dart';

void main() {
  final dataSource = ProductsRemoteDatasource();
  final repo = GetProductsRepoImpl(dataSource);
  final useCase = GetProductsUseCase(repo);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetProductsBloc(
            getproductsUseCase: useCase,
            getproductsDetailsUsecase: useCase,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(700, 700),
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
