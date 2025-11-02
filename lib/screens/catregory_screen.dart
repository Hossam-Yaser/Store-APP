import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/services/get/category_products_services.dart';
import 'package:store_app/widgets/products_list_view.dart';

class CatregoryScreen extends StatelessWidget {
  static String id = "Category Screen";

  const CatregoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: FutureBuilder(
        future: CategoryProductsServices().getCategoryProducts(
          categoryName: categoryName,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Products found in this Category'));
          }

          final products = snapshot.data!;
          return ProductsListView(productsList: products);
        },
      ),
    );
  }
}
