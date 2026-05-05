import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/products_cubit.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: Container(
        color: Colors.amber,
        child: Padding(
          padding: .symmetric(horizontal: 8, vertical: 14),
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              print(state);
              if (state is ProductsInitial) {
                context.read<ProductsCubit>().getProducts();
              }
              if (state is ProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProductsLoaded) {}
              if (state is ProductsEmpty) {
                return const Center(child: Text('Data tidak ada'));
              }
              if (state is ProductsError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
