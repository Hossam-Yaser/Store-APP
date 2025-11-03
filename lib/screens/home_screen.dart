import 'package:flutter/material.dart';
import 'package:liquid_glass_bottom_bar/liquid_glass_bottom_bar.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/locallistofproducts.dart';
import 'package:store_app/widgets/cart/cart_widget.dart';
import 'package:store_app/widgets/cart/emptycart_widget.dart';
import 'package:store_app/widgets/favourite/emptyfavourite.dart';
import 'package:store_app/widgets/favourite/favouritebody.dart';
import 'package:store_app/widgets/showproducts_widget.dart';
import 'package:store_app/widgets/addproduct/addproduct.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'MainScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final bool _showLabels = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: [
        ShowproductsWidget(),
        cartProducts.isEmpty ? EmptycartWidget() : CartWidget(),
        favouriteProducts.isEmpty
            ? Emptyfavourite()
            : Favouritebody(), // Placeholder for Favourite
        Updateproduct(), // Placeholder for Account
      ][_currentIndex],
      bottomNavigationBar: LiquidGlassBottomBar(
        items: const [
          LiquidGlassBottomBarItem(
            icon: Icons.home,
            activeIcon: Icons.home,
            label: 'Home',
          ),
          LiquidGlassBottomBarItem(
            icon: Icons.shopping_cart,
            activeIcon: Icons.shopping_cart,
            label: 'Cart',
          ),
          LiquidGlassBottomBarItem(
            icon: Icons.favorite_border,
            activeIcon: Icons.favorite,
            label: 'Favourite',
          ),
          LiquidGlassBottomBarItem(
            icon: Icons.arrow_upward,
            activeIcon: Icons.arrow_upward,
            label: 'Add Product',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (i) {
          if (_currentIndex != i) setState(() => _currentIndex = i);
        },
        showLabels: _showLabels,
        activeColor: kPrimaryColor,
      ),
    );
  }
}
