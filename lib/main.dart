import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection_container.dart';
import 'presentation/screens/products/cubit/products_cubit.dart';
import 'presentation/screens/products/pages/product_list_screen.dart';

void main() async {
  await initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsCubit>(),
      child: MaterialApp(
        title: 'Flutter Test App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ProductListScreen(),
      ),
    );
  }
}
