import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../widgets/auth_widets.dart';
import '../widgets/snack_bar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  bool isObsecure = false;
  late String email;
  late String password;
  bool isLoading = false;






  void signInUser()async{

    setState(() {
      isLoading = true;
    });


      if(_formKey.currentState!.validate()){
        try{
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
          _formKey.currentState!.reset();
          setState(() {
            isLoading =false;
          });
          Navigator.pushReplacementNamed(context, '/Customer_home');

        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            MessageHandler().showSnackBar(_scaffoldKey, 'User Not Found');
            setState(() {
              isLoading =false;
            });
            print('image picked');
            print('validate');

            print(email);
            print(password);
          } else if (e.code == 'wrong-password') {
            MessageHandler().showSnackBar(_scaffoldKey, 'wrong password');
            setState(() {
              isLoading =false;
            });
          }
        } catch (e) {
          print(e);

          setState(() {
            isLoading =false;
          });
        }
    }
      else{
        MessageHandler().showSnackBar(_scaffoldKey, 'please input all fields');

        setState(() {
          isLoading =false;
        });

      }


  }


  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body:SafeArea(child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [AuthenticationLebel(lebel: 'Sign In',),
                          IconButton(onPressed: (){}, icon: Icon(Icons.home_work,size: 40,))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        onChanged: (value){
                          email = value;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return 'please enter your Email';
                          }
                          return null;
                        },
                        decoration: authdecoration.copyWith(labelText: 'Email',hintText: 'Enter your Email'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                          onChanged: (value){
                            password = value;
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your password';
                            }
                            return null;
                          },
                          obscureText: isObsecure,
                          decoration: authdecoration.copyWith(

                              labelText: 'Password',hintText: 'Enter your Password',suffixIcon: IconButton(onPressed: (){

                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          }, icon: Icon(isObsecure? Icons.visibility_off:Icons.visibility,color: Colors.purple,)))

                      ),
                    ),
                    HaveAccount(lebel: 'Dont have an account',buttonLebel: 'Signup',onpressed: (){
                      Navigator.pushReplacementNamed(context, '/signup');
                    },),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: isLoading==false ? MainButton(lebel: 'Sign Up', onpressed: () {
                        signInUser();



                      },):CircularProgressIndicator(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),),
      ),
    );
  }
}



