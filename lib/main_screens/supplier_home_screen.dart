import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newstoreapp/dashboard_screens/upload_screen.dart';
import 'package:newstoreapp/main_screens/cart_screen.dart';
import 'package:newstoreapp/main_screens/category_screen.dart';
import 'package:newstoreapp/main_screens/customer_profile_screen.dart';
import 'package:newstoreapp/main_screens/dashboard_screen.dart';
import 'package:newstoreapp/main_screens/home_screen.dart';
import 'package:newstoreapp/main_screens/stores_screen.dart';
class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({Key? key}) : super(key: key);

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int currentIndex = 0;

  var WidgetsList = [
    const HomePage(),
    const CategoryScreen(),
    const StoresScreen(),
    DashBoardScreen(),
    UploadScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
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
