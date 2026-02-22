

import 'package:flutter/material.dart';
import 'package:recipe_pro/Order_screen/ordernow_screen.dart';

class DetailScreen extends StatelessWidget {
  final String recipeName;
  final String imagePath;

  const DetailScreen({
    super.key,
    required this.recipeName,
    required this.imagePath,
  });

  /// ✅ Description
  String _getDescription(String name) {
    return "$name is prepared with fresh ingredients and rich flavors. "
        "It is one of the most popular dishes loved by everyone. "
        "Perfect for lunch, dinner, and special occasions.";
  }

  /// ✅ Ingredients
  List<String> _getIngredients() {
    return [
      "Fresh Ingredients",
      "Spices",
      "Cheese",
      "Vegetables",
      "Sauce",
    ];
  }

  @override
  Widget build(BuildContext context) {
    final description = _getDescription(recipeName);
    final ingredients = _getIngredients();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(recipeName),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ✅ IMAGE (Fixed Height – Perfect Position)
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// ✅ NAME
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                recipeName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// ✅ DESCRIPTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// ✅ INGREDIENT TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// ✅ INGREDIENT LIST
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: ingredients.map((item) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text(item),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 30),

            /// ✅ ORDER BUTTON
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderNowScreen(
                        recipeName: recipeName,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Order Now",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}