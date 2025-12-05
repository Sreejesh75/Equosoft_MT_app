import 'package:flutter/material.dart';
import 'package:machine_test/features/product/presentation/products_screen.dart';
import 'package:machine_test/features/product/provider/product_provider.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    if (provider.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (provider.error != null) {
      return Scaffold(body: Center(child: Text(provider.error!)));
    }

    final categories = provider.uniqueCategories;

    return Scaffold(
      appBar: AppBar(title: const Text("Categories"), centerTitle: true),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final c = categories[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ProductsScreen(categoryId: c.id, categoryName: c.name),
                ),
              );
            },
            child: Card(
              elevation: 3,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      c.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.image_not_supported),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    c.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
