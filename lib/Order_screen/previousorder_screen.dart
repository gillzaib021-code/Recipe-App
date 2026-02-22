
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:recipe_pro/Order_screen/ordernow_screen.dart';

class PreviousOrderScreen extends StatelessWidget {
  const PreviousOrderScreen({super.key});

  /// ✅ Delete Dialog
  Future<bool?> _showDeleteDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Order'),
        content: const Text('Are you sure you want to delete this order?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ Delete from Firebase
  Future<void> _deleteFromFirebase(String docId) async {
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(docId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous Orders'),
        backgroundColor: Colors.green,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .where('userId', isEqualTo: user?.uid)
            .orderBy('date', descending: true)
            .snapshots(),

        builder: (context, snapshot) {

          /// ⏳ Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          /// 🔥 Get Firebase Orders
          final firebaseOrders = snapshot.data?.docs ?? [];

          /// 🔥 Get Hive Orders (Local)
          final hiveOrders = localOrders;

          /// 🔥 Combine Both Lists
          final allOrders = [
            ...firebaseOrders.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return {
                'id': doc.id,
                'itemName': data['itemName'],
                'quantity': data['quantity'],
                'price': data['price'],
                'date': (data['date'] as Timestamp).toDate(),
                'isFirebase': true,
              };
            }),
            ...hiveOrders.map((order) {
              return {
                'itemName': order['itemName'],
                'quantity': order['quantity'],
                'price': order['price'],
                'date': order['date'],
                'isFirebase': false,
              };
            }),
          ];

          if (allOrders.isEmpty) {
            return const Center(
              child: Text("No Previous Orders Found"),
            );
          }

          return ListView.builder(
            itemCount: allOrders.length,
            itemBuilder: (context, index) {

              final order = allOrders[index];
              final date = order['date'] as DateTime;
              final formattedDate =
                  DateFormat('dd MMM yyyy, hh:mm a').format(date);

              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.fastfood,
                    color: Colors.green,
                  ),
                  title: Text(
                    order['itemName'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Quantity: ${order['quantity']}\n"
                    "Price: Rs.${order['price']}\n"
                    "Date: $formattedDate",
                  ),
                  trailing: order['isFirebase'] == true
                      ? IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            final confirmed =
                                await _showDeleteDialog(context);

                            if (confirmed ?? false) {
                              await _deleteFromFirebase(order['id']);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Order Deleted Successfully"),
                                ),
                              );
                            }
                          },
                        )
                      : const Icon(
                          Icons.storage,
                          color: Colors.blue,
                        ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}