import 'package:flutter/material.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stores',style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
