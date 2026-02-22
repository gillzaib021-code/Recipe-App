
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipe_pro/Order_screen/previousorder_screen.dart';


List<Map<String, dynamic>> localOrders = [];

class OrderNowScreen extends StatefulWidget {
  final String recipeName;

  const OrderNowScreen({super.key, required this.recipeName});

  @override
  State<OrderNowScreen> createState() => _OrderNowScreenState();
}

class _OrderNowScreenState extends State<OrderNowScreen> {
  final _formKey = GlobalKey<FormState>();
  final _itemController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _itemController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  /// ✅ PLACE ORDER FUNCTION (Hive + Firebase Save)
  Future<void> _placeOrder() async {
    if (_formKey.currentState!.validate()) {
      final user = FirebaseAuth.instance.currentUser;

      final order = {
        'itemName': _itemController.text.trim(),
        'quantity': int.parse(_quantityController.text.trim()),
        'price': double.parse(_priceController.text.trim()),
        'date': DateTime.now(),
        'userId': user?.uid,
        'userEmail': user?.email,
      };

      /// ✅ 1. Save Locally (Hive)
      localOrders.add(order);

      /// ✅ 2. Save To Firebase Firestore
      await FirebaseFirestore.instance
          .collection('orders')
          .add(order);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Order Saved in Hive & Firebase ✅'),
        ),
      );

      _itemController.clear();
      _quantityController.clear();
      _priceController.clear();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PreviousOrderScreen(),
        ),
      );
    }
  }

  /// ✅ UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Now'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              /// 🟢 Item Name
              TextFormField(
                controller: _itemController,
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter item name' : null,
              ),

              const SizedBox(height: 15),

              /// 🟢 Quantity
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter quantity';
                  if (int.tryParse(v) == null) return 'Enter valid number';
                  return null;
                },
              ),

              const SizedBox(height: 15),

              /// 🟢 Price
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price (Rs)',
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter price';
                  if (double.tryParse(v) == null) return 'Enter valid price';
                  return null;
                },
              ),

              const SizedBox(height: 25),

              /// 🔥 Place Order Button
              ElevatedButton(
                onPressed: _placeOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  'Place Order',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 20),

              /// 📜 View Previous Orders
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PreviousOrderScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.history),
                label: const Text('View Previous Orders'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: Colors.green, width: 2),
                  foregroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}