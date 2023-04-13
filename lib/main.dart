import 'package:ecommercee/controller/hivefunction.dart';
import 'package:ecommercee/view/appbar.dart';
import 'package:ecommercee/view/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'controller/apiprovider.dart';
import 'controller/authprovider.dart';
import 'controller/profileprovider.dart';
import 'model/hive_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(modelAdapter().typeId)) {
    Hive.registerAdapter(modelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<IndexNotifier>(
          create: (_) => IndexNotifier(),
        ),
        ChangeNotifierProvider<Profileprovider>(
          create: (_) => Profileprovider(),
        ),
        ChangeNotifierProvider<Hiveprovider>(

          create: (_) => Hiveprovider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return appbar();
            } else {
              return Loginpage();
            }
          }),
        ),
      ),
    );
  }
}
     