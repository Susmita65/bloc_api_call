import 'dart:convert';
import 'package:api_project/core/config/routing/route_name.dart';
import 'package:api_project/presentation/bloc/getproducts_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class ProductsListsScreen extends StatefulWidget {
  const ProductsListsScreen({super.key});

  @override
  State<ProductsListsScreen> createState() => _ProductsListsScreenState();
}

class _ProductsListsScreenState extends State<ProductsListsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<GetproductsBloc>().add(GetAllProductsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mock Api Call Using Bloc')),

      body: BlocBuilder<GetproductsBloc, GetproductsState>(
        builder: (context, state) {
          if (state is GetproductsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetproductsLoaded) {
            final productsList = state.products;
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(16.0),
                  sliver: SliverMasonryGrid.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childCount: productsList.length,
                    crossAxisCount: 2,
                    itemBuilder: (context, index) {
                      final product = productsList[index];
                      return GestureDetector(
                        onTap: () {
                          context.read<GetproductsBloc>().add(
                            SelectProductsEvent(
                              selctedProductId: product.id ?? 0,
                            ),
                          );
                          context.push(RouteName.productsDetailsScreenRoute);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: CachedNetworkImage(
                            imageUrl: product.thumbnail ?? '',
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          if (state is GetproductsFailure) {
            return Center(child: Text(state.error));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
