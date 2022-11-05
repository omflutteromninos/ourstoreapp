import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newstoreapp/widgets/yellow_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    controller.repeat();
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  CollectionReference collectionReference = FirebaseFirestore.instance.collection('customers');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/inapp/bgimage.jpg'),fit: BoxFit.cover,

          ),

        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedTextKit(isRepeatingAnimation: true,repeatForever: true,animatedTexts: [ColorizeAnimatedText('Welcome', textStyle: TextStyle(fontSize: 50,fontWeight: FontWeight.bold), colors: [Colors.yellow,Colors.red, Colors.blueAccent,Colors.green, Colors.purple]),
                ColorizeAnimatedText('Duck Store', textStyle: TextStyle(fontSize: 50,fontWeight: FontWeight.bold), colors: [Colors.yellow,Colors.red, Colors.blueAccent,Colors.green, Colors.purple]),

              ]),
              //const Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 32),),
              SizedBox(height: 120,width: 200,child: Image.asset('images/inapp/logo.jpg'),),
             // const Text('Shop',style: TextStyle(color: Colors.white,fontSize: 32),),
              SizedBox(
                height: 50,
                child: DefaultTextStyle(

                  
                  style: const TextStyle(color: Colors.blueAccent,fontSize: 50,fontWeight: FontWeight.bold),
                  child: AnimatedTextKit(isRepeatingAnimation: true,repeatForever:true,animatedTexts: [
                    RotateAnimatedText('Shop'),
                    RotateAnimatedText('Duck Store'),
                    RotateAnimatedText('Enjoy'),
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),

                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Suppliers Only',style: TextStyle(fontSize: 30,color: Colors.yellow),),
                        ),
                      ),
                      SizedBox(height: 6,),
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: const BoxDecoration(

                            color: Colors.white38,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              AnimatedBuilder(animation: controller.view,
                              builder: (BuildContext context, Widget? child) {
                                return Transform.rotate(angle:controller.value* 2*pi,child: child,);
                              },
                              child: Image.asset('images/inapp/logo.jpg')),
                              YellowButton(label: 'Login', onpressed: (){
                                Navigator.pushReplacementNamed(context, '/supplier_signup');
                              }, width: 0.25),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: YellowButton(label: 'SignUp', onpressed: (){
                                  Navigator.pushReplacementNamed(context, '/supplier_signup');
                                }, width: 0.25),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: const BoxDecoration(

                        color: Colors.white38,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: YellowButton(label: 'Login', onpressed: (){
                              Navigator.pushReplacementNamed(context, '/signin');
                            }, width: 0.25),
                          ),
                          YellowButton(label: 'SignUp', onpressed: (){
                            Navigator.pushNamed(context, '/signup');
                          }, width: 0.25),
                          AnimatedBuilder(animation: controller.view,
                          builder: (BuildContext context, Widget? child) {
                            return Transform.rotate(angle: controller.value*2*pi,child: child,);
                          },
                          child: Image.asset('images/inapp/logo.jpg')),
                        ],
                      )
                  ),
                ],
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white38,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                 googlefacebook(lebel: 'google',child: Image.asset('images/inapp/google.jpg',height: 50,width: 50,),),
                 googlefacebook(lebel: 'facebook',child: Image.asset('images/inapp/facebook.jpg',height: 50,width: 50,),),
                 InkWell(
                   onTap: () async{
                     print('hiii');
                    await FirebaseAuth.instance.signInAnonymously().whenComplete(() {
                      collectionReference.doc(FirebaseAuth.instance.currentUser!.uid).set({
                        'username':'guest',
                        'email':'you  havent added your gmail',
                        'profileimage':'https://pixabay.com/get/g79912fd538fd0861156464eef26427713ada7634e817e8cd92dd398ec08f51f6eef25848f8af0a8c80486d36621621673c4a619d303ee8b4be0106caca5436790f0612213fd490b77429e664fe30e796_640.jpg',
                        'phonenumber': 'no number',
                        'address':'no addresss',
                        'cid':FirebaseAuth.instance.currentUser!.uid,
                      });
                    });
                    Navigator.pushReplacementNamed(context, '/Customer_home');
                   },
                     child: googlefacebook(lebel: 'Guest',child: Icon(Icons.person,color: Colors.blueAccent,size: 50,))),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class googlefacebook extends StatelessWidget {
  googlefacebook({
    Key? key,required this.child,required this.lebel,
  }) : super(key: key);
  Widget child;
  String lebel;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),child:   Column(
         children: [
           child,
           Text(lebel,style: TextStyle(color: Colors.white),)
         ],
       ));
  }
}
