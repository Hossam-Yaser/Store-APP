import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';

class Emptyfavourite extends StatelessWidget {
  const Emptyfavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Image.asset(emptyFavouriteImage, scale: 0.7),
              SizedBox(height: 50),
              Text(
                "There are no products in your favourite list ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
