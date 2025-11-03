import 'package:flutter/material.dart';
import 'package:store_app/helper/locallistofproducts.dart';
import 'package:store_app/screens/productdetails_screen.dart';
import 'package:store_app/widgets/cart/cartproduct_card_widget.dart';

class CartproductlistviewWidget extends StatefulWidget {
  const CartproductlistviewWidget({super.key});

  @override
  State<CartproductlistviewWidget> createState() =>
      _CartproductlistviewWidgetState();
}

class _CartproductlistviewWidgetState extends State<CartproductlistviewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
