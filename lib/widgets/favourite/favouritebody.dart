import 'package:flutter/material.dart';
import 'package:store_app/helper/locallistofproducts.dart';
import 'package:store_app/widgets/products_list_view.dart';

class Favouritebody extends StatelessWidget {
  const Favouritebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 24, horizontal: 16),
      child: ProductsListView(productsList: favouriteProducts),
    );
  }
}
