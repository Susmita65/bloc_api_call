import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:new_bloc_api_practice/core/config/routing/route_name.dart';
import 'package:new_bloc_api_practice/features/get_products/presentation/bloc/get_products_bloc.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetProductsBloc>().add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Products Lists Screen')),
      body: BlocBuilder<GetProductsBloc, GetProductsState>(
        builder: (context, state) {
          if (state.status == FetchProductsStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == FetchProductsStatus.error) {
            return Center(child: Text("No Products Found"));
          }
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverMasonryGrid.count(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childCount: state.product.length,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) {
                    final product = state.product[index];
                    return GestureDetector(
                      onTap: () {
                        context.read<GetProductsBloc>().add(
                          UpdateProductIDEvent(productID: product.id),
                        );
                        context.push(RouteName.productsDetailsScreenRoute);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
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
        },
      ),
    );
  }
}
