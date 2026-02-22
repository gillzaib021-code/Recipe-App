// import 'package:flutter/material.dart';
// import 'package:recipe_pro/Order_screen/ordernow_screen.dart';
// import 'package:recipe_pro/widget.dart';


// class FriesDetailScreen extends StatelessWidget {
//   const FriesDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Column(
//               children: [
//                 SizedBox(
//                   height: screenHeight * 0.4,
//                   width: double.infinity,
//                   child: Image.asset(
//                     'assets/sale/fries.png',
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(50),
//                             topRight: Radius.circular(50)),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 8,
//                               spreadRadius: 2,
//                               offset: Offset(0, -2))
//                         ]),
//                     padding: EdgeInsets.symmetric(
//                         horizontal: screenWidth * 0.06,
//                         vertical: screenHeight * 0.03),
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Crispy Fries',
//                                     style: AppWidget.healinTextstyle(
//                                         screenWidth * 0.07)),
//                                 SizedBox(height: screenHeight * 0.01),
//                                 Text(
//                                   'Ingredients:\n• Potatoes\n• Salt & oil\n• Seasoning of choice',
//                                   style: TextStyle(fontSize: screenWidth * 0.045),
//                                 ),
//                                 SizedBox(height: screenHeight * 0.02),
//                                 Text('Directions:',
//                                     style: AppWidget.healinTextstyle(
//                                         screenWidth * 0.06)),
//                                 Text(
//                                   'Cut potatoes, soak in water, deep fry until golden and crispy.',
//                                   style: TextStyle(fontSize: screenWidth * 0.045),
//                                 ),
//                                 SizedBox(height: screenHeight * 0.04),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           height: 55,
//                           child: ElevatedButton.icon(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const OrderNowScreen(recipeName: 'recipename',)));
//                             },
//                             icon: const Icon(Icons.shopping_cart_outlined,
//                                 color: Colors.white),
//                             label: Text(
//                               'Order Now',
//                               style: TextStyle(
//                                   fontSize: screenWidth * 0.05,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12)),
//                               elevation: 5,
//                               shadowColor: Colors.greenAccent,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               top: screenHeight * 0.02,
//               left: screenWidth * 0.04,
//               child: GestureDetector(
//                 onTap: () => Navigator.pop(context),
//                 child: Container(
//                   padding: EdgeInsets.all(screenWidth * 0.025),
//                   decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Icon(Icons.arrow_back,
//                       color: Colors.white, size: screenWidth * 0.06),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:recipe_pro/Order_screen/detail_screen.dart';
import 'package:recipe_pro/Order_screen/previousorder_screen.dart';
import 'package:recipe_pro/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  bool _isDarkMode = false;

  /// ✅ 10 Recipes
  List<Map<String, dynamic>> allRecipes = [
    {'label': 'Pizza', 'image': 'assets/images/itilian.png'},
    {'label': 'Zinger Burger', 'image': 'assets/images/zinger burger.jpg'},
    {'label': 'Biryani', 'image': 'assets/sale/biryani.png'},
    {'label': 'Fries', 'image': 'assets/sale/fries.png'},
    {'label': 'Mintmargrita', 'image': 'assets/sale/mintmargrita.png'},
    {'label': 'Parata', 'image': 'assets/sale/parata.jpg'},
    {'label': 'Russian Salad', 'image': 'assets/sale/russian salad.png'},
    {'label': 'Shwarma', 'image': 'assets/sale/shwarma.png'},
    {'label': 'Cake', 'image': 'assets/images/cake.png'},
    {'label': 'Shawarma', 'image': 'assets/images/shawarma.png'},
  ];

  List<Map<String, dynamic>> filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    filteredRecipes = allRecipes;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const PreviousOrderScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor:
            _isDarkMode ? Colors.grey[900] : Colors.grey[100],

        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// ================= TOP BAR =================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    PopupMenuButton<String>(
                      icon: Icon(Icons.menu,
                          size: 30,
                          color: _isDarkMode
                              ? Colors.white
                              : Colors.black),
                      onSelected: (value) {
                        if (value == 'Theme') {
                          setState(() {
                            _isDarkMode = !_isDarkMode;
                          });
                        } else if (value == 'History') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const PreviousOrderScreen(),
                            ),
                          );
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: 'History',
                          child: Text('History'),
                        ),
                        PopupMenuItem(
                          value: 'Theme',
                          child: Text('Toggle Theme'),
                        ),
                      ],
                    ),

                    const Text(
                      "Mr.Cook",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                          'assets/profile_image/profile images.jpeg'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// ================= TITLE =================
                Text(
                  "What would you like to Cook?",
                  style:
                      AppWidget.healinTextstyle(screenWidth * 0.06),
                ),

                const SizedBox(height: 15),

                /// ================= SEARCH =================
                TextField(
                  onChanged: (value) {
                    setState(() {
                      filteredRecipes = allRecipes
                          .where((recipe) => recipe['label']
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search Recipe...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor:
                        _isDarkMode ? Colors.grey[800] : Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// ================= GRID VIEW =================
                GridView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  itemCount: filteredRecipes.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {

                    final recipe = filteredRecipes[index];

                    return _buildRecipeCard(
                      imagePath: recipe['image'],
                      label: recipe['label'],
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        /// ================= BOTTOM NAV =================
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
          ],
        ),
      ),
    );
  }

  /// ================= RECIPE CARD =================
  Widget _buildRecipeCard({
    required String imagePath,
    required String label,
  }) {
    return GestureDetector(
      onTap: () {
        /// ✅ Open Detail Screen (NOT Order Screen Direct)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              recipeName: label,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _isDarkMode
              ? Colors.grey[800]
              : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            /// Image
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Label
            Container(
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}