import 'package:flutter/material.dart';
import 'package:newstoreapp/minor_screens/subcateg_screens.dart';
import 'package:newstoreapp/utilities/categ_list.dart';

import '../widgets/category_list_widgets.dart';

class BeautyCategory extends StatefulWidget {
  const BeautyCategory({Key? key}) : super(key: key);

  @override
  State<BeautyCategory> createState() => _BeautyCategoryState();
}

class _BeautyCategoryState extends State<BeautyCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.76,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategName(Name: 'Beauty',),
                  CategProductView( categName: 'Beauty', imageUrl: 'images/beauty/beauty', CategoryList: beauty,)
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SideBox(Name: 'beauty',),
                ),
              ))
        ],
      ),
    );
  }
}
