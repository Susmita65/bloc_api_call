import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_bloc_api_practice/features/get_products/presentation/bloc/get_products_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetProductsBloc>().add(GetProductsDetailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details Screen'), centerTitle: true),
      body: BlocBuilder<GetProductsBloc, GetProductsState>(
        builder: (context, state) {
          if (state.status == FetchProductsStatus.loading) {
            return CircularProgressIndicator();
          } else if (state.status == FetchProductsStatus.error) {
            return Center(child: Text("No Products Found"));
          }
          final product = state.productDetails;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product?.thumbnail ?? 'assets/images/doctor.jpg',
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image);
                      },
                      height: 200.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  product?.title ?? 'No Title',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Rs ${product?.price.toString() ?? ''}",
                  style: TextStyle(fontSize: 12.sp),
                ),

                SizedBox(height: 16),
                Text(
                  product?.description ?? 'No description',
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
