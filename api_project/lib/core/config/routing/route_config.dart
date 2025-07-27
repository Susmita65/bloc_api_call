import 'package:api_project/core/config/routing/route_name.dart';
import 'package:api_project/presentation/screens/product_details_screen.dart';
import 'package:api_project/presentation/screens/products_lists_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter get router => GoRouter(
  //initial route ko name dine yesari
  initialLocation: RouteName.homeRoute,
  routes: <GoRoute>[
    GoRoute(
      path: RouteName.homeRoute,
      builder: (context, state) {
        return ProductsListsScreen();
      },
    ),
    GoRoute(
      path: '/productDetails',
      // name: 'productsDetailsScreenRoute',
      builder: (context, state) => ProductDetailsScreen(),
    ),
  ],
);
