
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../controller/authprovider.dart';
import '../navbar.dart';
import 'cart.dart';
import 'page.dart';

class appbar extends StatelessWidget {
  appbar({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 5, 31),
        leading: IconButton(
            icon: Icon(Iconsax.more),
            onPressed: () => _scaffoldKey.currentState!.openDrawer()),
        actions: <Widget>[
          InkWell(
            child: IconButton(
              icon: Icon(Iconsax.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          )
        ],
        centerTitle: true,
        toolbarHeight: 199,
        title: Image.asset(
          'assets/images/pngegg.png',
          width: 100,
        ),
        bottom: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Welcome Back!\n            .....",
                  style: TextStyle(
                      color: Color.fromARGB(
                        255,
                        255,
                        252,
                        252,
                      ),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: TextField(
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Search for something',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      prefixIcon: Icon(
                        Iconsax.search_normal_14,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Iconsax.voice_cricle,
                        color: Colors.black,
                      )),
                ),
              )
            ],
          ),
          preferredSize: Size.zero,
        ),
      ),
      drawer: Consumer<AuthProvider>(
        builder: (context, userDataProvider, child) {
          return StreamBuilder<Map<String, dynamic>>(
            stream: userDataProvider.getUserData(),
            builder: (context, snapshot) {
              User? user = FirebaseAuth.instance.currentUser;
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return NavBar(
                    age: '${data['age']}',
                    address: '${data['address']}',
                    name: '${data['name']}',
                    email: '${data['Email']}',
                    phone: '${data['Phone number']}');
              } else {
                return NavBar(
                  email: '${user?.email}',
                  name: '${user?.displayName}',
                  phone: '${user?.phoneNumber}',
                  address: '',
                  age: '',
                );
              }
            },
          );
        },
      ),
      body: page(),
    );
  }
}
