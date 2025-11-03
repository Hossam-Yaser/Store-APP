import 'package:flutter/material.dart';
import 'package:store_app/widgets/cart/cartproductlistview_widget.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: CartproductlistviewWidget());
  }
}
