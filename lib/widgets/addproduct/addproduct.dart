import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/services/post/add_product_service.dart';
import 'package:store_app/widgets/addproduct/custom_text_field.dart';

// ignore: must_be_immutable
class Updateproduct extends StatelessWidget {
  late String productName;
  late String description;
  late String price;
  late String image;
  late String category;
  Updateproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
        child: Column(
          children: [
            CustomTextfield(
              hintText: 'Product Name',
              onChanged: (value) {
                productName = value;
              },
            ),
            SizedBox(height: 40),
            CustomTextfield(
              hintText: "Description",
              onChanged: (value) {
                description = value;
              },
            ),
            SizedBox(height: 40),
            CustomTextfield(
              inputType: TextInputType.number,
              hintText: "Price",
              onChanged: (value) {
                price = value;
              },
            ),
            SizedBox(height: 40),
            CustomTextfield(
              hintText: "Image",
              onChanged: (value) {
                image = value;
              },
            ),
            SizedBox(height: 40),
            CustomTextfield(
              hintText: "Category",
              onChanged: (value) {
                category = value;
              },
            ),

            SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                elevation: 100,
              ),
              onPressed: () async {
                try {
                  // Await the async add operation
                  await AddProductService().addProduct(
                    title: productName,
                    price: price,
                    description: description,
                    image: image,
                    category: category,
                  );

                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Product added successfully!'),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );
                } catch (e) {
                  // Handle error and show failure message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to add product: $e'),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              },

              child: Text(
                "Add Product",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
