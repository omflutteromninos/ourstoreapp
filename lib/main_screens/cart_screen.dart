import 'package:flutter/material.dart';
import 'package:newstoreapp/main_screens/customer_home_screen.dart';

import '../widgets/yellow_button.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key, this.GoBack}) : super(key: key);
  Widget? GoBack;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: widget.GoBack,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Cart', style: TextStyle(color: Colors.black, ),),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever,color: Colors.black,))
          ],
        ),

        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Your Cart is empty',style: TextStyle(color: Colors.black,fontSize: 32),),
SizedBox(height: 50,),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,


                  decoration: BoxDecoration(

                      color: Colors.blue,
                    borderRadius: BorderRadius.circular(25)
                  ),

                  child: MaterialButton(onPressed: (){
                    Navigator.canPop(context)?Navigator.pop(context):
                    Navigator.pushReplacementNamed(context, '/Customer_home');
                  },child: Text('Continue Shopping',style: TextStyle(fontSize: 16,color: Colors.white),),))

            ],
          ),
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Total \$ ',style: TextStyle(fontSize: 16),),
                Text('0.00',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red),),
              ],
            ),

            YellowButton(label: 'Cart', onpressed: () {  },width: 0.45, )
          ],
        ),
      ),
    ));
  }
}
