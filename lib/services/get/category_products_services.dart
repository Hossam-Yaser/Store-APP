import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoryProductsServices {
  Future<List<ProductModel>> getCategoryProducts({
    required String categoryName,
  }) async {
    List<dynamic> data = await Api().get(
      url: "https://fakestoreapi.com/products/category/$categoryName",
    );
    List<ProductModel> categoryProducts = data
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();
    return categoryProducts;
  }
}
