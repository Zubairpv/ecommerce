import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profileprovider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool update = false;
  late DocumentSnapshot userProfile;

  final User? user = FirebaseAuth.instance.currentUser;
  updateprofile() {
    final city = <String, String>{
      'name': usernameController.text,
      'Phone number': phoneNumberController.text,
      'address': addressController.text,
      'age': ageController.text,
    };
    try {
      FirebaseFirestore.instance
          .collection('User data')
          .doc(user!.uid)
          .update(city);
     
      notifyListeners();
    } catch (e) {
      print(addressController);
    }
  }



  
  }
