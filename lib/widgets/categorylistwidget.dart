import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/screens/catregory_screen.dart';

// ignore: must_be_immutable
class CategoryListWidget extends StatelessWidget {
  List<dynamic> categories;
  CategoryListWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                CatregoryScreen.id,
                arguments: categories[index],
              );
            },
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kPrimaryColor, width: 3),
              ),
              child: Text(
                categories[index],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
