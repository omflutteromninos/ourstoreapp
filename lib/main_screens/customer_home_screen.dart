import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newstoreapp/main_screens/cart_screen.dart';
import 'package:newstoreapp/main_screens/category_screen.dart';
import 'package:newstoreapp/main_screens/customer_profile_screen.dart';
import 'package:newstoreapp/main_screens/home_screen.dart';
import 'package:newstoreapp/main_screens/stores_screen.dart';
class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int currentIndex = 0;

  var WidgetsList = [
    HomePage(),
    CategoryScreen(),
    StoresScreen(),
    CartScreen(),
    CustomerProfileScreen(FirebaseAuth.instance.currentUser!.uid),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetsList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
       // unselectedItemColor: Colors.lightGreenAccent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,

        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'category'),
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
        onTap: (Index){
          setState(() {
            currentIndex = Index;
          });
        },

      ),
    );
  }
}
