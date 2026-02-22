import 'package:hive_ce_flutter/adapters.dart';

part 'order_model.g.dart'; // Run build_runner to generate adapter

@HiveType(typeId: 0)
class OrderModel extends HiveObject {
  @HiveField(0)
  String itemName;

  @HiveField(1)
  int quantity;

  @HiveField(2)
  double price;

  @HiveField(3)
  String date;

  OrderModel({
    required this.itemName,
    required this.quantity,
    required this.price,
    required this.date,
  });
}
