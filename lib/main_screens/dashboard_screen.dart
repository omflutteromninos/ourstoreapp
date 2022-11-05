import 'package:flutter/material.dart';
import 'package:newstoreapp/dashboard_screens/balance_screen.dart';
import 'package:newstoreapp/dashboard_screens/edit_profile_screen.dart';
import 'package:newstoreapp/dashboard_screens/manage_products_screen.dart';
import 'package:newstoreapp/dashboard_screens/my_store.dart';
import 'package:newstoreapp/dashboard_screens/orders_screen.dart';
import 'package:newstoreapp/dashboard_screens/statistics_screen.dart';
import 'package:newstoreapp/widgets/dialogure_box.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List labels = [
      'My Store',
      'Orders',
      'Edit Profile',
      'Manage Products',
      'Balance',
      'Statistics'
    ];
    List<IconData> icondata = [
      Icons.store,
      Icons.shop_2_outlined,
      Icons.edit,
      Icons.settings,
      Icons.attach_money,
      Icons.show_chart
    ];
    List Pages = [
      const MyStore(),
      const Orders(),
      const EditProfile(),
      const ManageProducts(),
      const Balance_screen(),
      const StatisticsScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Dashboard Screen',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){
           Cupertinomodel(context);
          }, icon: Icon(Icons.logout,color: Colors.black,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.count(crossAxisCount: 2,mainAxisSpacing: 50,crossAxisSpacing: 50, children: List.generate(6, (index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Pages[index];
              }));
            },
            child: Card(
              shadowColor: Colors.purpleAccent.shade200,
              elevation: 20,
              color: Colors.blueGrey.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(icondata[index],size: 50,color:Colors.yellowAccent,),
                  Text(labels[index].toString().toUpperCase(),style: TextStyle(color: Colors.yellowAccent,fontSize: 24,fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          );
        }),),
      ),
    );
  }
}
