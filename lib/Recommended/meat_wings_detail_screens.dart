// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:recipe_pro/Order_screen/ordernow_screen.dart';
import 'package:recipe_pro/widget.dart';


class MeatWingsDetailScreen extends StatelessWidget {
  const MeatWingsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
  

  final screenwidth=MediaQuery.of(context).size.width;
  final  screenhight=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meat Wings Recipe'),
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
                  'assets/images/wingsthree.png',
                  height: screenhight*0.4,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Text('Meat Wings', style: AppWidget.healinTextstyle(25)),
              const SizedBox(height: 10),
              Text(
                'These crispy and spicy meat wings are perfect for dinner or parties. '
                'They are marinated in rich spices and fried to perfection.',
               style: AppWidget.healinTextstyle(20),
              ),
              const SizedBox(height: 20),
              Text('Ingredients:', style: AppWidget.healinTextstyle(20)),
              const SizedBox(height: 5),
              const Text('- Chicken wings\n- Garlic paste\n- Red chili powder\n- Lemon juice\n- Salt\n- Flour for coating\n- Oil for frying'),
              const SizedBox(height: 20),
              Text('Directions:', style: AppWidget.healinTextstyle(20)),
              const SizedBox(height: 5),
              const Text(
                  '1. Marinate wings with all spices for 2 hours.\n'
                  '2. Coat them lightly in flour.\n'
                  '3. Deep fry on medium heat until golden brown.\n'
                  '4. Serve hot with garlic sauce or ketchup.'),


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
                                  fontSize: screenwidth * 0.05,
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
