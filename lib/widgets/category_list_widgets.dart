import 'package:flutter/material.dart';

import '../minor_screens/subcateg_screens.dart';


class CategProductView extends StatelessWidget {
  CategProductView({
    required this.categName,required this.imageUrl,required this.CategoryList,
    Key? key,
  }) : super(key: key);
  String categName;
  //String title;
  String imageUrl;

  List<String> CategoryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.68,
      child: GridView.count(crossAxisSpacing: 20, mainAxisSpacing: 20,crossAxisCount: 3, children: List.generate(CategoryList.length, (index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){

              return SubCategScreen(title: CategoryList[index], CategoryName: categName,);
            }));
          },
          child: Column(
            children: [
              SizedBox(height: 70,width: 70,child: Image.asset('${imageUrl + index.toString()+ '.jpg'}')),
              Text(CategoryList[index]),
            ],
          ),
        );
      }),),
    );
  }
}

class SideBox extends StatelessWidget {
  SideBox({
    required this.Name,
    Key? key,
  }) : super(key: key);
  String Name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.04,
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30)
      ),
      child: RotatedBox(quarterTurns: 3,child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text('<<',style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 3
        ),
        ),
          Text(Name,style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 3
          ),
          ),
          Text('>>',style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 3
          ),
          ),

        ],
      ),),
    );
  }
}

class CategName extends StatelessWidget {
  CategName({
    Key? key, required this.Name
  }) : super(key: key);
  String Name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(Name,style: TextStyle(fontSize: 24,color: Colors.black, fontWeight: FontWeight.bold),),
    );
  }
}
