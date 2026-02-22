import 'package:flutter/material.dart';
import 'package:recipe_pro/Order_screen/ordernow_screen.dart';
import 'package:recipe_pro/home_screen.dart';
import 'package:recipe_pro/widget.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Special Deals"),
        backgroundColor: Colors.green,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()), 
            );
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Exclusive Food Deals 🍽️', style: AppWidget.healinTextstyle(25)),
            const SizedBox(height: 10),
            Text(
              'Grab your favorite dishes at amazing discounts. All deals are valid for a limited time!',
              style: AppWidget.healinTextstyle(20),
            ),
            const SizedBox(height: 20),

           
            _buildDealCard(
              context, 
              image: 'assets/images/itilian.png',
              title: 'Cheese Burst Pizza',
              description: 'Hot cheesy pizza with extra toppings — 20% OFF today!',
              price: 'Rs. 650',
              discount: 'Rs. 520',
            ),
            _buildDealCard(
              context, 
              image: 'assets/images/zinger burger.jpg',
              title: 'Zinger Burger Combo',
              description: 'Crispy zinger burger with fries and drink — 25% OFF!',
              price: 'Rs. 750',
              discount: 'Rs. 560',
            ),
            _buildDealCard(
              context,
              image: 'assets/sale/biryani.png',
              title: 'Spicy Chicken Biryani',
              description: 'Authentic taste with special masala — 30% OFF!',
              price: 'Rs. 500',
              discount: 'Rs. 350',
            ),
            _buildDealCard(
              context,
              image: 'assets/sale/fries.png',
              title: 'Crispy Fries Deal',
              description: 'Golden fries with cheesy dip — 15% OFF!',
              price: 'Rs. 300',
              discount: 'Rs. 255',
            ),
            _buildDealCard(
              context,
              image: 'assets/sale/mintmarit.jpeg',
              title: 'Mint Margarita',
              description: 'Cool refreshing mint drink — 10% OFF!',
              price: 'Rs. 200',
              discount: 'Rs. 180',
            ),
            _buildDealCard(
              context,
              image: 'assets/sale/parata.jpg',
              title: 'Stuffed Paratha Deal',
              description: 'Delicious paratha with raita — 20% OFF!',
              price: 'Rs. 250',
              discount: 'Rs. 200',
            ),
            _buildDealCard(
              context,
              image: 'assets/sale/fried_chicken.png',
              title: 'Crispy Fried Chicken',
              description: '2 pieces of juicy fried chicken — 25% OFF!',
              price: 'Rs. 600',
              discount: 'Rs. 450',
            ),
            _buildDealCard(
              context,
              image: 'assets/sale/shwarma.png',
              title: 'Chicken Shawarma',
              description: 'Spicy juicy shawarma roll — 15% OFF!',
              price: 'Rs. 400',
              discount: 'Rs. 340',
            ),

            const SizedBox(height: 20),
            Center(
              child: Text(
                '🔥 Hurry! Limited time offers!',
                style: TextStyle(
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

 
  Widget _buildDealCard(
    BuildContext context, 
    {
    required String image,
    required String title,
    required String description,
    required String price,
    required String discount,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 237, 236, 236),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                image,
                height: 120,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),

          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        discount,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                 
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderNowScreen(recipeName: 'recipename',), 
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Order Now'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
