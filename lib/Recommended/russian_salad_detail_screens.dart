import 'package:flutter/material.dart';
import 'package:recipe_pro/Order_screen/ordernow_screen.dart';
import 'package:recipe_pro/widget.dart';


class RussianSaladDetailScreen extends StatelessWidget {
  const RussianSaladDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenhight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Russian Salad Recipe'),
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
                  'assets/sale/russian salad.png',
                  height: screenhight*0.4,
                  width: double.infinity,
                  fit: BoxFit.contain
                ),
              ),
              const SizedBox(height: 20),
              Text('Russian Salad', style: AppWidget.healinTextstyle(25)),
              const SizedBox(height: 10),
              Text(
                'A creamy and colorful salad made with vegetables, fruits, and mayonnaise — a great side dish for any meal.',
                style: AppWidget.healinTextstyle(20),
              ),
              const SizedBox(height: 20),
              Text('Ingredients:', style: AppWidget.healinTextstyle(20)),
              const SizedBox(height: 5),
              const Text('- Boiled potatoes\n- Apples\n- Carrots\n- Peas\n- Pineapple chunks\n- Mayonnaise\n- Salt & black pepper'),
              const SizedBox(height: 20),
              Text('Directions:', style: AppWidget.healinTextstyle(20)),
              const SizedBox(height: 5),
              const Text(
                  '1. Boil and chop all vegetables.\n'
                  '2. Mix with apples and pineapple.\n'
                  '3. Add mayonnaise, salt, and pepper.\n'
                  '4. Chill before serving for best taste.'),

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
