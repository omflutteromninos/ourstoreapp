import 'package:flutter/material.dart';

class Balance_screen extends StatelessWidget {
  const Balance_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Balance Screen',style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,onPressed: (){Navigator.pop(context);},),
      ),
    );
  }
}