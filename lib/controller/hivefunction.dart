import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/hive_model.dart';

class Hiveprovider extends ChangeNotifier {
  ValueNotifier<List<model>> details = ValueNotifier([]);
  Future<void> addtoCart(model value) async {
    final modeldb = await Hive.openBox<model>('model_db');
    final existingIndex =
        modeldb.values.toList().indexWhere((item) => item.id == value.id);
    if (existingIndex >= 0) {
      // If the item is already in the cart, update its quantity
      final existingItem = modeldb.getAt(existingIndex);
      existingItem?.quantity += value.quantity;
      await modeldb.putAt(existingIndex, existingItem!);
    } else {
      // Otherwise, add a new item to the cart
      await modeldb.add(value);
    }
    notifyListeners();
  }

  Future<void> getalldata() async {
    final modeldb = await Hive.openBox<model>('model_db');
    details.value.clear();
    details.value.addAll(modeldb.values);
    notifyListeners();
  }

  buttonclicked(
      String name, String brand, int price, String image, int quantity) async {
    final model1 = model(
        name: name,
        brand: brand,
        image: image,
        quantity: quantity,
        price: price);
    if (name.isEmpty || brand.isEmpty || image.isEmpty) {
      return;
    }
    addtoCart(model1);
    notifyListeners();
  }

  Future<void> delete(int id) async {
    final modeldb = await Hive.openBox<model>('model_db');
    await modeldb.deleteAt(id);
    getalldata();
    notifyListeners();
  }

  Future<void> update(int id) async {
    final modeldb = await Hive.openBox<model>('model_db');
    var a = modeldb.getAt(id);
    a?.quantity += 1;
    modeldb.putAt(id, a!);
    getalldata();
    notifyListeners();
  }

  Future<void> reduce(int id) async {
    final modeldb = await Hive.openBox<model>('model_db');
    var a = modeldb.getAt(id);
    a?.quantity -= 1;
    modeldb.putAt(id, a!);
    getalldata();
    notifyListeners();
  }

  //...

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (final item in details.value) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }

  //...

}
