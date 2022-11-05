import 'package:flutter/material.dart';

class YellowButton extends StatelessWidget {
  YellowButton({
    Key? key,required this.label, required this.onpressed, required this.width
  }) : super(key: key);

  String label;
  VoidCallback onpressed;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.yellow,
      ),
      child: MaterialButton(onPressed: onpressed,
        child: Text(label),
      ),
    );
  }
}
