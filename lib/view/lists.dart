import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller/authprovider.dart';

final firestoreInstance = FirebaseFirestore.instance;
List<Widget> social(BuildContext context) {
  final authProvider = Provider.of<AuthProvider>(context);
  if (authProvider.formType == FormType.login) {
    return [
      Expanded(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.blue),
          child: Center(
            child: Text(
              "Facebook",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      SizedBox(
        width: 30,
      ),
      Expanded(
        child: InkWell(
          onTap: () async {
            authProvider.signInWithGoogle();
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.black),
            child: Center(
              child: Text(
                "Google",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      )
    ];
  } else {
    return [];
  }
}

List<Widget> buildinputs(BuildContext context) {
  final authProvider = Provider.of<AuthProvider>(context);
  if (authProvider.formType == FormType.login) {
    return [
      SizedBox(
        height: 10,
      ),
      TextFormField(
        onSaved: (value) {
          authProvider.email = value!;
        },
        validator: (value) => value!.isEmpty ? "Email can't be Empty" : null,
        decoration: InputDecoration(
            hintText: "   Email or Phone number",
            hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            border: InputBorder.none),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
        child: TextFormField(
          obscureText: true,
          onSaved: (value) {
            authProvider.password = value!;
          },
          validator: (value) =>
              value!.isEmpty ? "Password can't be Empty" : null,
          decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              border: InputBorder.none),
        ),
      ),
    ];
  } else {
    return [
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
        child: TextFormField(
          onSaved: (value) {
            authProvider.name = value!;
          },
          validator: (value) => value!.isEmpty ? "Name can't be Empty" : null,
          decoration: InputDecoration(
              hintText: "Enter your name",
              hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              border: InputBorder.none),
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
        child: TextFormField(
          onSaved: (value) {
            authProvider.phone = value!;
          },
          keyboardType: TextInputType.numberWithOptions(),
          validator: (value) =>
              value!.isEmpty ? "Phone number can't be Empty" : null,
          decoration: InputDecoration(
              hintText: "Enter your Phone number",
              hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              border: InputBorder.none),
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
        child: TextFormField(
          onSaved: (value) {
            authProvider.email = value!;
          },
          validator: (value) => value!.isEmpty ? "Email can't be Empty" : null,
          decoration: InputDecoration(
              hintText: "Email Id",
              hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              border: InputBorder.none),
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
        child: TextFormField(
          onSaved: (value) {
            authProvider.password = value!;
          },
          validator: (value) =>
              value!.isEmpty ? "Password can't be Empty" : null,
          decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              border: InputBorder.none),
        ),
      ),
    ];
  }
}

List<Widget> submitbutton(BuildContext context) {
  final authProvider = Provider.of<AuthProvider>(context);
  authProvider.formType == FormType.login;
  if (authProvider.formType == FormType.login) {
    return [
      InkWell(
        onTap: () {
          authProvider.submit();
          authProvider.getUserData();
        },
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange[900]),
          child: Center(
            child: Text(
              "Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          authProvider.moveToRegister();
        },
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange[900]),
          child: Center(
            child: Text(
              "Signup",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ];
  } else {
    return [
      InkWell(
        onTap: () {
          authProvider.create();
        },
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange[900]),
          child: Center(
            child: Text(
              "Signup",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          authProvider.moveToLogin();
        },
        child: Container(
          height: 55,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromARGB(255, 0, 0, 0)),
          child: Center(
            child: Text(
              "already have\n an account\nlogin",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ];
  }
}
