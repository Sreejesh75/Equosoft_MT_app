import 'package:flutter/material.dart';
import 'package:machine_test/features/product/presentation/products_details_screen.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class ProductsScreen extends StatelessWidget {
  final int categoryId;
  final String categoryName;

  const ProductsScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    // Filter products by category
    final products = provider.getProductsByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),

      body: products.isEmpty
          ? const Center(child: Text("No products available"))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: products.length,
              itemBuilder: (_, index) {
                final p = products[index];

                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: Image.network(
                      p.images.first,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(p.title),
                    subtitle: Text("\$${p.price}"),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(product: p),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
