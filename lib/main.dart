import 'package:flutter/material.dart';
import 'package:store_app/screens/catregory_screen.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/productdetails_screen.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _routes,
      initialRoute: HomeScreen.id,
    );
  }
}

final Map<String, WidgetBuilder> _routes = {
  HomeScreen.id: (context) => HomeScreen(),
  CatregoryScreen.id: (context) => CatregoryScreen(),
  ProductdetailsScreen.id: (context) => ProductdetailsScreen(),
};
