import 'package:flutter/material.dart';
import 'package:recipe_pro/Order_screen/ordernow_screen.dart';
import 'package:recipe_pro/widget.dart';


class SandwichDetailScreen extends StatelessWidget {
  const SandwichDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenhight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Recipe'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/sandwitch.png',
                  height: screenhight*0.4,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Text('Sandwich', style: AppWidget.healinTextstyle(25)),
              const SizedBox(height: 10),
              Text(
                'A simple and delicious sandwich filled with fresh vegetables, cheese, and mayo — perfect for lunch or a light snack.',
                style: AppWidget.healinTextstyle(20),
              ),
              const SizedBox(height: 20),
              Text('Ingredients:', style: AppWidget.healinTextstyle(20)),
              const SizedBox(height: 5),
              const Text('- Bread slices\n- Lettuce\n- Tomato\n- Cucumber\n- Cheese slice\n- Mayonnaise\n- Butter'),
              const SizedBox(height: 20),
              Text('Directions:', style: AppWidget.healinTextstyle(20)),
              const SizedBox(height: 5),
              const Text(
                  '1. Spread butter and mayo on bread slices.\n'
                  '2. Place vegetables and cheese.\n'
                  '3. Grill or toast the sandwich lightly.\n'
                  '4. Cut in halves and serve with ketchup or fries.'),

                                   SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderNowScreen(recipeName: 'recipename',)));
                            },
                            icon: const Icon(Icons.shopping_cart_outlined,
                                color: Colors.white),
                            label: Text(
                              'Order Now',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 5,
                              shadowColor: Colors.greenAccent,
                            ),
                          ),
                        ),

                  
            ],
          ),
        ),
      ),
    );
  }
}
