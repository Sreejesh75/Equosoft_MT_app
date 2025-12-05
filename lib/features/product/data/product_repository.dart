import '../../../core/api_client.dart';
import 'product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> fetchProducts() async {
    final res = await ApiClient.get("/products?limit=20&offset=20");

    return (res as List).map((json) => ProductModel.fromJson(json)).toList();
  }
}
