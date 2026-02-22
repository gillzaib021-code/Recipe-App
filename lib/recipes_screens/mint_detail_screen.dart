import 'package:flutter/material.dart';
import 'package:recipe_pro/Order_screen/ordernow_screen.dart';
import 'package:recipe_pro/widget.dart';


class MintDetailScreen extends StatelessWidget {
  const MintDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.4,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/sale/mintmarit.jpeg',
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(0, -2))
                        ]),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                        vertical: screenHeight * 0.03),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Mint Margarita',
                                    style: AppWidget.healinTextstyle(
                                        screenWidth * 0.07)),
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  'Ingredients:\n• Mint leaves\n• Lemon juice\n• Sugar\n• Soda water\n• Ice cubes',
                                  style: TextStyle(fontSize: screenWidth * 0.045),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Text('Instructions:',
                                    style: AppWidget.healinTextstyle(
                                        screenWidth * 0.06)),
                                Text(
                                  'Blend all ingredients together and serve chilled.',
                                  style: TextStyle(fontSize: screenWidth * 0.045),
                                ),
                                SizedBox(height: screenHeight * 0.04),
                              ],
                            ),
                          ),
                        ),
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
                                  fontSize: screenWidth * 0.05,
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
              ],
            ),
            Positioned(
              top: screenHeight * 0.02,
              left: screenWidth * 0.04,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.025),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(Icons.arrow_back,
                      color: Colors.white, size: screenWidth * 0.06),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
