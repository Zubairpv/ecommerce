import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../view/cart.dart';
import '../model/model.dart';

class IndexNotifier extends ChangeNotifier {
   Ecommerce?  data;
  ProviderStatus status = ProviderStatus.LOADING;
   int? reponse;


  Future<void> fetchQuestion() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    reponse = response.statusCode;
    if (response.statusCode == 200) {
      status = ProviderStatus.COMPLETED;
      data = ecommerceFromJson(response.body);
    } else {
      
      throw Exception('Failed to load album');
    }
    // ignore: dead_code
    notifyListeners();
  }
}
