import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../widgets/auth_widets.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../widgets/snack_bar.dart';

class SupplierSignUp extends StatefulWidget {
  const SupplierSignUp({Key? key}) : super(key: key);

  @override
  State<SupplierSignUp> createState() => _SupplierSignUpState();
}

class _SupplierSignUpState extends State<SupplierSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  bool isObsecure = false;
  late String userName;
  late String email;
  late String password;
  late String productImageUrl;
  bool isLoading = false;
  ImagePicker _picker = ImagePicker();
  XFile? productImage;

  CollectionReference collectionReference = FirebaseFirestore.instance.collection('suppliers');



  pickImageCamera() async{
    var myImage = await _picker.pickImage(source: ImageSource.camera);
    setState((){
      productImage = myImage;
    });



  }
  pickImageGallery() async{
    var myImage = await _picker.pickImage(source: ImageSource.gallery);
    setState((){
      productImage = myImage;
    });
  }

  void signUpUser()async{

    setState(() {
      isLoading = true;
    });


    if(_formKey.currentState!.validate()){
      if(productImage != null){
        try{
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);



          firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('supplier-image/$email.jpg');
          await ref.putFile(File(productImage!.path));
          productImageUrl= (await ref.getDownloadURL());

          await collectionReference.doc(FirebaseAuth.instance.currentUser!.uid).set({
            'username':userName,
            'email':email,
            'productImage':productImageUrl,
            'phonenumber': '',
            'address':'',
            'sid':FirebaseAuth.instance.currentUser!.uid,
          });
          _formKey.currentState!.reset();
          //Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/Supplier_home');

          setState(() {
            isLoading =false;
          });

        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            MessageHandler().showSnackBar(_scaffoldKey, 'The password provided is too weak');

            setState(() {
              isLoading =false;
            });
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            MessageHandler().showSnackBar(_scaffoldKey, 'The account already exists for that email');
            print('The account already exists for that email.');

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
        print('image picked');
        print('validate');
        print(userName);
        print(email);
        print(password);


      }
      else{
        MessageHandler().showSnackBar(_scaffoldKey, 'please select image');

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
                        children: [AuthenticationLebel(lebel: ' Store Sign Up',),
                          IconButton(onPressed: (){}, icon: Icon(Icons.home_work,size: 40,))
                        ],
                      ),
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                          child: CircleAvatar(radius: 60,backgroundColor: Colors.purple,
                            backgroundImage: productImage ==null?null: FileImage(File(productImage!.path)),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(

                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),

                              ),
                              child: IconButton(onPressed: (){
                                pickImageCamera();
                              },icon: Icon(Icons.camera_alt,color: Colors.white,),),
                            ),
                            SizedBox(height: 5,),
                            Container(

                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),

                              ),
                              child: IconButton(onPressed: (){
                                pickImageGallery();
                              }, icon:  Icon(Icons.image,color: Colors.white,),),
                            ),
                          ],
                        )
                      ],),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                          onChanged: (value){
                            userName = value;
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your Store Name';
                            }
                            return null;
                          },
                          decoration: authdecoration.copyWith(labelText: 'Store Name',hintText: 'Enter your Store Name')

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
                            return 'please enter your Store Email';
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
                    HaveAccount(lebel: 'Already have an account?',buttonLebel: 'Login',onpressed: (){},),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: isLoading==false ? MainButton(lebel: 'Sign Up', onpressed: () {
                        signUpUser();



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



