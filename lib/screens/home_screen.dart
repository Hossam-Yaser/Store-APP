import 'package:flutter/material.dart';
import 'package:liquid_glass_bottom_bar/liquid_glass_bottom_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/services/get/allcategories_services.dart';
import 'package:store_app/services/get/allproducts_service.dart';
import 'package:store_app/widgets/categorylistwidget.dart';
import 'package:store_app/widgets/productcard_widget.dart';
import 'package:store_app/widgets/products_list_view.dart';

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
      body: Column(
        children: [
          FutureBuilder(
            future: AllcategoriesServices().getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No categories found'));
              }

              final categories = snapshot.data!;
              return CategoryListWidget(categories: categories);
            },
          ),
          Expanded(
            child: FutureBuilder(
              future: AllProductsService().getAllProducts(),
              builder: (context, snapshot) {
                // While loading -> show skeleton
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show fake product skeletons
                  final fakeProducts = List.generate(
                    6,
                    (index) => {
                      'image': '',
                      'title': 'Product',
                      'price': '000',
                    },
                  );

                  return Skeletonizer(
                    enabled: true,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                      itemCount: fakeProducts.length,
                      itemBuilder: (context, index) {
                        final product = fakeProducts[index];
                        return ProductCard(
                          imageUrl: product['image']!,
                          title: product['title']!,
                          price: product['price']!,
                        );
                      },
                    ),
                  );
                }

                // If error
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                // If no data
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No Products found'));
                }

                // Show actual products
                final products = snapshot.data!;
                return ProductsListView(productsList: products);
              },
            ),
          ),
        ],
      ),
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
            icon: Icons.account_box,
            activeIcon: Icons.account_box,
            label: 'Account',
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
