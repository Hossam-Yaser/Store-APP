import 'package:flutter/material.dart';
import 'package:store_app/helper/locallistofproducts.dart';
import 'package:store_app/screens/productdetails_screen.dart';
import 'package:store_app/widgets/cart/cartproduct_card_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductdetailsScreen.id,
                arguments: cartProducts[index],
              );
            },

            child: CartProductCardWidget(
              product: cartProducts[index],
              onIncrease: () {
                setState(() => cartProducts[index].amount++);
              },
              onDecrease: () {
                setState(() {
                  if (cartProducts[index].amount > 1) {
                    cartProducts[index].amount--;
                  }
                });
              },
              onRemove: () {
                setState(() => cartProducts.remove(cartProducts[index]));
              },
            ),
          );
        },
      ),
    );
  }
}
