import 'package:flutter/material.dart';
import '../data/product_model.dart';
import '../data/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository repo;

  ProductProvider(this.repo);

  bool isLoading = false;
  String? error;
  List<ProductModel> products = [];

  Future<void> loadProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      products = await repo.fetchProducts();
      error = null;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  // For category filtering later
  List<ProductModel> getProductsByCategory(int categoryId) {
    return products.where((p) => p.category.id == categoryId).toList();
  }

  // Extract unique categories
  List<CategoryModel> get uniqueCategories {
    final set = <int>{};
    final list = <CategoryModel>[];

    for (var p in products) {
      if (!set.contains(p.category.id)) {
        set.add(p.category.id);
        list.add(p.category);
      }
    }

    return list;
  }
}
