import 'package:flutter/cupertino.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/productdetails_screen.dart';
import 'package:store_app/widgets/productcard_widget.dart';

// ignore: must_be_immutable
class ProductsListView extends StatelessWidget {
  ProductsListView({super.key, required this.productsList});
  List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productsList.length,
      physics: ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items per row
        mainAxisSpacing: 10, // Vertical space between rows
        crossAxisSpacing: 10, // Horizontal space between items
        childAspectRatio: 0.65, // Adjust the height/width ratio
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductdetailsScreen.id,
              arguments: productsList[index],
            );
          },
          child: ProductCard(
            imageUrl: productsList[index].image,
            title: productsList[index].title,
            price: productsList[index].price.toString(),
          ),
        );
      },
    );
  }
}
