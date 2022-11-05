import 'package:flutter/material.dart';
class SubCategScreen extends StatelessWidget {
  SubCategScreen({Key? key, required this.title, required this.CategoryName}) : super(key: key);
  String title;
  String CategoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(title,style: TextStyle(color: Colors.black),),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios), color: Colors.black, onPressed: () {
          Navigator.pop(context);
        },),
      ),
    );
  }
}
