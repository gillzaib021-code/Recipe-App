import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_pro/Detail_screen/deals_screen.dart';
import 'package:recipe_pro/Order_screen/ordernow_screen.dart';
import 'package:recipe_pro/Order_screen/previousorder_screen.dart';
import 'package:recipe_pro/firebase_options.dart';
import 'package:recipe_pro/home_screen.dart';
import 'package:recipe_pro/login_signup_screens/login_screen.dart';
import 'package:recipe_pro/login_signup_screens/signup_screen.dart';
import 'package:recipe_pro/model/order_model.dart';
import 'package:recipe_pro/onboarding.dart' show Onboarding;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);


  final directory = await getApplicationCacheDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(OrderModelAdapter());
  await Hive.openBox<OrderModel>('orders');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(primarySwatch: Colors.orange),
      
      home: const LoginScreen(),
      routes: {

        '/loginscreen':(context)=>LoginScreen(),
        '/signupscreen':(context)=>SignupScreen(),
        '/onbording':(context)=>Onboarding(),
        '/home': (context)=>HomeScreen(),
        '/Dealsscreen':(context)=>DealsScreen(),
        '/orderNow': (context) => OrderNowScreen(recipeName: '',),
        '/previousOrder': (context) =>  PreviousOrderScreen(),
      },
    );
  }
}




