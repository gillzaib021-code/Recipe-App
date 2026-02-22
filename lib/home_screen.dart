
import 'package:flutter/material.dart';
import 'package:recipe_pro/Detail_screen/deals_screen.dart';
import 'package:recipe_pro/Order_screen/detail_screen.dart';
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
    {'label': 'Shawarma', 'image': 'assets/sale/shwarma.png'},
    {'label': 'Russian Salad', 'image': 'assets/sale/russian salad.png'},
    {'label': 'Mint Margarita', 'image': 'assets/sale/mintmarit.jpeg'},
    {'label': 'Sandwich', 'image': 'assets/sale/mintmargrita.png'},
    {'label': 'Parata', 'image': 'assets/sale/parata.jpg'},
    {'label': 'Salad', 'image': 'assets/sale/russian salad.png'},
  ];

  List<Map<String, dynamic>> filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    filteredRecipes = allRecipes;
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
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// ================= TOP BAR =================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    /// Menu
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
                        }
                      },
                      itemBuilder: (context) => const [
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
                  style: AppWidget.healinTextstyle(
                      screenWidth * 0.06),
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
          selectedItemColor: Colors.green,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });

            /// ✅ Deals Screen
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DealsScreen(),
                ),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: "Deals",
            ),
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

        /// ✅ Open Detail Screen
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
          color: _isDarkMode ? Colors.grey[800] : Colors.white,
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