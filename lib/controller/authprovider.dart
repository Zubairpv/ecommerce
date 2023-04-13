import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum FormType { login, register }

class AuthProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String name;
  late String phone;
  FormType formType = FormType.login;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isgoogle = false;
  User? _user;
  User? get user => _user;

  bool validateAndSave() {
    final Form = formKey.currentState;
    if (Form!.validate()) {
      Form.save();
      return true;
    }
    return false;
  }

  Future<dynamic> signInWithGoogle() async {
    isgoogle == true;
    try {
      // Trigger the Google Authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the credential
      final userCredential = await auth.signInWithCredential(credential);
      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      print('error$e');
    }
  }

  var db = FirebaseFirestore.instance;
  late UserCredential usercredential;
  Future<dynamic> submit() async {
    if (validateAndSave()) {
      try {
        final userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        _user = userCredential.user;
      } catch (e) {
        print('error$e');
      }
    }
  }

  Future<dynamic> create() async {
    if (validateAndSave()) {
      try {
        final userCredential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        final city = <String, String>{
          "name": name,
          "Email": email,
          "Phone number": phone
        };
        db.collection("User data").doc(userCredential.user!.uid).set(city);

        _user = userCredential.user;
        usercredential = userCredential;

        notifyListeners();
      } catch (e) {
        debugPrint('error$e');
      }
    }
  }

  Stream<Map<String, dynamic>> getUserData() async* {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      yield* db
          .collection('User data')
          .doc(user.uid)
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          final data = documentSnapshot.data() as Map<String, dynamic>;

          notifyListeners();

          return data;
        } else {
          throw StateError('User data does not exist');
        }
      });
    } else {
      throw StateError('User is not authenticated');
    }
  }

  void moveToRegister() {
    formKey.currentState!.reset();
    formType = FormType.register;
    notifyListeners();
  }

  void moveToLogin() {
    formKey.currentState!.reset();
    formType = FormType.login;
    notifyListeners();
  }
}
