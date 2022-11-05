import 'package:flutter/material.dart';
class MainButton extends StatelessWidget {
  MainButton({
    Key? key, required this.lebel, required this.onpressed
  }) : super(key: key);
  String lebel;
  VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(30),



        child: MaterialButton(
          minWidth: double.infinity,

          onPressed:onpressed, child: Text(lebel,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),));
  }
}

class HaveAccount extends StatelessWidget {
  HaveAccount({
    Key? key,required this.lebel,required this.buttonLebel,required this.onpressed
  }) : super(key: key);
  String lebel;
  String buttonLebel;
  Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(lebel, style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic),),
        TextButton(onPressed: onpressed, child: Text(buttonLebel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.purple),))
      ],
    );
  }
}

class AuthenticationLebel extends StatelessWidget {
  AuthenticationLebel({
    Key? key,required this.lebel,
  }) : super(key: key);
  String lebel;

  @override
  Widget build(BuildContext context) {
    return Text(lebel,  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40),);
  }
}

var authdecoration = InputDecoration(
  labelText: 'Full Name',
  hintText: 'Enter your Full Name',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),

  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(color: Colors.purpleAccent,width: 1),

  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(color: Colors.pinkAccent,width: 2),

  ),

);
