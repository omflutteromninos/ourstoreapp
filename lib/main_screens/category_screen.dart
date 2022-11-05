import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newstoreapp/category/accesories_category.dart';
import 'package:newstoreapp/category/bags_category.dart';
import 'package:newstoreapp/category/beauty_category.dart';
import 'package:newstoreapp/category/electronics_category.dart';
import 'package:newstoreapp/category/homegarden.dart';
import 'package:newstoreapp/category/kids_category.dart';
import 'package:newstoreapp/category/men_category.dart';
import 'package:newstoreapp/category/women_category.dart';
import 'package:newstoreapp/widgets/fake_search.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var ItemsList = [
    Items(itemName: 'Men'),
    Items(itemName: 'Women'),
    Items(itemName: 'Electronics'),
    Items(itemName: 'Accesories'),
    Items(itemName: 'Home and Garden'),
    Items(itemName: 'Beauty'),
    Items(itemName: 'Kids'),
    Items(itemName: 'Bags'),
  ];
  PageController _pageController= PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: FakeSearch(),

      ),
      body: Stack(
        children: [
          Positioned(left: 0,bottom: 0,child: Container(

           // color: Colors.grey,
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.2,
            child: ListView.builder(itemCount: ItemsList.length,itemBuilder: (context, int Index){
              return GestureDetector(
                onTap: (){
                  _pageController.animateToPage(Index, duration: Duration(milliseconds: 100), curve: Curves.linearToEaseOut);
                  // for(var i in ItemsList){
                  //   i.isSelected = false;
                  // }
                  // setState(() {
                  //
                  //   ItemsList[Index].isSelected = true;
                  // });

                },
                child: Container(
                  color: ItemsList[Index].isSelected == true ? Colors.white : Colors.grey,
                  height: 100,
                  child: Center(child: Text('${ItemsList[Index].itemName}')),
                ),
              );
            }),
          ),


          ),
          Positioned(
            bottom: 0,
          right: 0,

          child: Container(

            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
            child: PageView(
              controller: _pageController,
              onPageChanged: (value){
                for(var i in ItemsList){
                  i.isSelected = false;
                }
                setState(() {

                  ItemsList[value].isSelected = true;
                });

              },
              scrollDirection: Axis.vertical,
              children: [
               MenCategory(),
                WomenCategory(),
                ElectronicsCategory(),
               AccessoriesCategory(),
                HomeGardenCategory(),
               BeautyCategory(),
                KidsCategory(),
                BagsCategory(),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class Items{
  String itemName;
  bool isSelected;
  Items({required this.itemName, this.isSelected =false});
}
