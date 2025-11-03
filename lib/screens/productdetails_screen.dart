import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/locallistofproducts.dart';
import 'package:store_app/models/product_model.dart';

class ProductdetailsScreen extends StatefulWidget {
  static String id = 'ProductdetailsScreen';
  const ProductdetailsScreen({super.key});

  @override
  State<ProductdetailsScreen> createState() => _ProductdetailsScreenState();
}

class _ProductdetailsScreenState extends State<ProductdetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  Product Image + Heart Icon
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),

                    child: Image.network(
                      product.image,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, anim) =>
                        ScaleTransition(scale: anim, child: child),
                    child: IconButton(
                      key: ValueKey<bool>(
                        favouriteProducts.any((p) => p.id == product.id),
                      ),
                      icon: Icon(
                        favouriteProducts.any((p) => p.id == product.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: favouriteProducts.any((p) => p.id == product.id)
                            ? Colors.red
                            : Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          final index = favouriteProducts.indexWhere(
                            (p) => p.id == product.id,
                          );
                          if (index != -1) {
                            favouriteProducts.removeAt(index);
                          } else {
                            favouriteProducts.add(product);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),

              // Product Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              //  Price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${product.price.toString().trim()}  LE",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                product.description,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 16, left: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            elevation: 100,
          ),

          onPressed: () {
            if (true) {
              final index = cartProducts.indexWhere((p) => p.id == product.id);

              if (index != -1) {
                cartProducts[index].amount += 1;
              } else {
                cartProducts.add(product);
              }
            }

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 50),
                    SizedBox(height: 10),
                    Text(
                      'Done',
                      style: TextStyle(fontSize: 20, color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
            );
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).pop();
            });
          },
          child: const Text(
            'ADD TO CART',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
