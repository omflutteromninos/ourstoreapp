import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Orders',style: TextStyle(color: Colors.black),),
        leading: BackButton(color:Colors.black,onPressed: (){Navigator.pop(context);},),
      ),
    );
  }
}