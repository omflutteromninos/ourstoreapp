import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newstoreapp/main_screens/cart_screen.dart';
import 'package:newstoreapp/profile_screens/orders_screen.dart';
import 'package:newstoreapp/profile_screens/wishlist_screen.dart';
import 'package:newstoreapp/widgets/dialogure_box.dart';


class CustomerProfileScreen extends StatefulWidget {
  final String documentId;

  CustomerProfileScreen(this.documentId);

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference customers = FirebaseFirestore.instance.collection('customers');

    return FutureBuilder<DocumentSnapshot>(
      future: customers.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: Stack(
                children: [
                  Container(
                    height: 210,
                    decoration: BoxDecoration(

                      gradient: LinearGradient(colors: [Colors.yellow, Colors.brown]),
                    ),
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        elevation: 0,
                        backgroundColor: Colors.white,
                        expandedHeight: 140,
                        flexibleSpace: LayoutBuilder(builder: (context, constraints){
                          return FlexibleSpaceBar(
                            title: AnimatedOpacity(opacity: constraints.biggest.height<=120?1:0, duration: Duration(milliseconds: 200),
                              child: const Text('Profile', style: TextStyle(color: Colors.black),),
                            ),
                            background: Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [Colors.yellow, Colors.brown])
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20,left: 30),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.,
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                     // backgroundImage: AssetImage('images/inapp/guest.jpg'),
                                      backgroundImage: NetworkImage(data['profileimage']),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text('${data['username']}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                        ,
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Container(
                              decoration:  BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height:80,width: MediaQuery.of(context).size.width * 0.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),

                                    ),
                                    child: TextButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (builder){
                                        return CartScreen();
                                      }));
                                    }, child: SizedBox(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width * 0.2,
                                        child: Center(child: Text('Cart',style: TextStyle(color: Colors.yellow),)))),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),

                                    ),
                                    child: TextButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (builder){
                                        return Orders_Screen();
                                      }));
                                    }, child: SizedBox(

                                        height: 40,
                                        width: MediaQuery.of(context).size.width * 0.2,
                                        child: Center(child: Text('Orders',style: TextStyle(color: Colors.black54),)))),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),

                                    ),
                                    child: TextButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (builder){
                                        return WishListScreen();
                                      }));
                                    }, child: SizedBox(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width * 0.2,
                                        child: Center(child: Text('WishList',style: TextStyle(color: Colors.yellow),)))),
                                  ),

                                ],
                              ),

                            ),
                            Container(
                              color: Colors.grey.shade300,
                              child: Column(
                                children: [
                                  SizedBox(height: 150,
                                    child: Image.asset('images/inapp/logo.jpg'),

                                  ),
                                  AccountInfoLebel(lebel: 'Account Info',),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text('Email Address'),
                                          subtitle: Text('${data['email']}]'),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 40),
                                          child: Divider(
                                            thickness: 1,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text('Phone Number'),
                                          subtitle: Text('+91 7888359070'),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 40),
                                          child: Divider(
                                            thickness: 1,
                                            color: Colors.yellow,
                                          ),
                                        ),

                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text('Address'),
                                          subtitle: Text('My colony'),
                                        ),




                                      ],

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AccountInfoLebel(lebel: 'Account Settings'),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.edit),
                                          title: Text('Edit Profile'),
                                          //subtitle: Text('Example@gmial.com'),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 40),
                                          child: Divider(
                                            thickness: 1,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.lock),
                                          title: Text('Change Passoword'),
                                          //subtitle: Text('+91 7888359070'),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 40),
                                          child: Divider(
                                            thickness: 1,
                                            color: Colors.yellow,
                                          ),
                                        ),

                                        ListTile(
                                          onTap: () {
                                            Cupertinomodel(context);

                                          },
                                          leading: Icon(Icons.login),
                                          title: Text('Log Out'),
                                          // subtitle: Text('My colony'),
                                        ),




                                      ],

                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ]
            ),
          );
            //Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}










// class CustomerProfileScreen extends StatefulWidget {
//   const CustomerProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
// }
//
// class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//
//     return 
//   }




class AccountInfoLebel extends StatelessWidget {
  AccountInfoLebel({
    Key? key,required this.lebel
  }) : super(key: key, );
  String lebel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const SizedBox(
          width: 30,
          child: Divider(thickness: 1,color: Colors.grey,height: 20,),),
        Text('  $lebel  ',style: TextStyle(fontSize: 24, color: Colors.grey,fontWeight: FontWeight.bold),),
        SizedBox(
          width: 30,
          child: Divider(thickness: 1,color: Colors.grey,height: 20,),),
      ],
    ),

    );
  }
}


void MyNavigation(Widget myWidget, BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return myWidget;
  }));

}


