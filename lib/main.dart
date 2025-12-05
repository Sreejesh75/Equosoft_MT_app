import 'package:flutter/material.dart';
import 'package:machine_test/features/caregories/presentation/categories_screen.dart';
import 'package:machine_test/features/product/data/product_repository.dart';
import 'package:machine_test/features/product/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(ProductRepository())..loadProducts(),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CategoriesScreen(),
    );
  }
}
