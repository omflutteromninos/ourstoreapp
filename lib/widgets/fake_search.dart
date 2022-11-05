import 'package:flutter/material.dart';
class FakeSearch extends StatelessWidget {
  const FakeSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow, width: 1.5),
        borderRadius: BorderRadius.circular(35),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Icon(Icons.search, color: Colors.grey,),
              ),
              Text('What are you looking for',style: TextStyle(fontSize: 18,color: Colors.grey),),
            ],
          ),

          Container(
            height: 32,
            width: 75,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Center(
              child: Text('Search',style: TextStyle(fontSize: 18,color: Colors.grey),),
            ),
          )
        ],
      ),
    );
  }
}