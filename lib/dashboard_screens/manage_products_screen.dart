import 'package:flutter/material.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Manage Products',style: TextStyle(color: Colors.black),),
        leading: BackButton(color:Colors.black,onPressed: (){Navigator.pop(context);},),
      ),
    );
  }
}