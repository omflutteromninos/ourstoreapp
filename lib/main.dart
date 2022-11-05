import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newstoreapp/auth/signin_screen.dart';
import 'package:newstoreapp/auth/signup_screen.dart';
import 'package:newstoreapp/auth/supplier_signup.dart';
import 'package:newstoreapp/main_screens/supplier_home_screen.dart';
import 'package:newstoreapp/main_screens/welcome_screen.dart';

import 'main_screens/customer_home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home: WelcomeScreen(),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context)=>WelcomeScreen(),
        '/Customer_home': (context)=>CustomerHomeScreen(),
        '/Supplier_home': (context)=>SupplierHomeScreen(),
        '/signup': (context)=>SignUpScreen(),
        '/signin': (context)=>SignInScreen(),
        '/supplier_signup': (context)=>SupplierSignUp(),


      },
    );
  }
}
