import 'package:flutter/material.dart';
class MessageHandler{
  void showSnackBar(var _scaffoldKey,String lebel){
    _scaffoldKey.currentState!.hideCurrentSnackBar();
    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(lebel)));
  }
}