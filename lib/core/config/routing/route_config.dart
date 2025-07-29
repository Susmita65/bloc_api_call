import 'package:go_router/go_router.dart';
import 'package:new_bloc_api_practice/core/config/routing/route_name.dart';
import 'package:new_bloc_api_practice/features/get_products/presentation/screens/dashboard_screen.dart';
import 'package:new_bloc_api_practice/features/get_products/presentation/screens/products_details_screen.dart';

GoRouter get router => GoRouter(
  //initial route ko name dine yesari
  initialLocation: RouteName.homeRoute,
  routes: <GoRoute>[
    GoRoute(
      path: RouteName.homeRoute,
      builder: (context, state) {
        return DashboardScreen();
      },
    ),
    GoRoute(
      path: '/productDetails',
      // name: 'productsDetailsScreenRoute',
      builder: (context, state) => ProductDetailsScreen(),
    ),
  ],
);
