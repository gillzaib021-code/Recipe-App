import 'package:flutter/material.dart';
import 'package:recipe_pro/home_screen.dart';
import 'package:recipe_pro/widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30.0),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🟩 Responsive Image
                SizedBox(
                  height: screenHeight * 0.4,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/recipe.png',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  '30k+ PREMIUM RECIPES',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                Text(
                  "It's Cooking Time!",
                  style: AppWidget.healinTextstyle(screenWidth * 0.07),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 15),

                const Text(
                  'Cooking time is the period needed to prepare and cook food properly. It affects the taste, texture, and quality of a dish. Different foods require different cooking durations. Proper timing prevents food from being undercooked or overcooked. Good control of cooking time helps make meals tasty and healthy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),

                const SizedBox(height: 30),

                // 🟩 Button
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
