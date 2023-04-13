import 'package:hive_flutter/hive_flutter.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0)
class model {
  @HiveField(0)
  int? id; // Add this line to define the id field

  @HiveField(1)
  final String name;
  @HiveField(2)
  final String brand;
  @HiveField(3)
  final int price;
  @HiveField(4)
  final String image;
  @HiveField(5)
  int quantity;

  model({
    this.id, // Add this line to make the id field optional
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    required this.quantity,
  });
}
