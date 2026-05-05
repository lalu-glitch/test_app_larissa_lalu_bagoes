import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/widget_error.dart';
import '../../../../data/models/product_model.dart';
import '../cubit/products_cubit.dart';
import '../widgets/widget_product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void refresh() {
      context.read<ProductsCubit>().getProducts();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: RefreshIndicator(
        onRefresh: () async => refresh(),
        child: Container(
          color: Colors.white30,
          child: Padding(
            padding: .symmetric(horizontal: 8, vertical: 14),
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsInitial) {
                  context.read<ProductsCubit>().getProducts();
                }
                if (state is ProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProductsLoaded) {
                  return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      Product dataProduct = state.products[index];
                      return ProductCard(data: dataProduct);
                    },
                  );
                }
                if (state is ProductsEmpty) {
                  return const Center(child: Text('Data tidak ada'));
                }
                if (state is ProductsError) {
                  return WidgetError(
                    message: state.message,
                    callback: () async => refresh(),
                    callbackMessageOnButton: 'Refresh',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
