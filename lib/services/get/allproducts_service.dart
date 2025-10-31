import 'dart:core';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(
      url: "https://fakestoreapi.com/products",
      token: null,
    );
    List<ProductModel> products = data
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();
    return products;
  }
}
