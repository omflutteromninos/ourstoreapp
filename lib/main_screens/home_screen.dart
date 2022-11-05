

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newstoreapp/utilities/categ_list.dart';

import '../widgets/fake_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length:maincateg.length, child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: FakeSearch(),
        bottom: TabBar(
          isScrollable: true,
        indicatorColor: Colors.yellow,
        indicatorWeight: 8,
        tabs: [

          Tab(child: Text('${maincateg[0]}', style: TextStyle(color: Colors.grey.shade600),),),
          Tab(child: Text('${maincateg[1]}', style: TextStyle(color: Colors.grey.shade600),),),
          Tab(child: Text('${maincateg[2]}', style: TextStyle(color: Colors.grey.shade600),),),
          Tab(child: Text('${maincateg[3]}', style: TextStyle(color: Colors.grey.shade600),),),
          Tab(child: Text('${maincateg[4]}', style: TextStyle(color: Colors.grey.shade600),),),
          Tab(child: Text('${maincateg[5]}', style: TextStyle(color: Colors.grey.shade600),),),
          Tab(child: Text('${maincateg[6]}', style: TextStyle(color: Colors.grey.shade600),),),
          Tab(child: Text('${maincateg[7]}', style: TextStyle(color: Colors.grey.shade600),),),
          Tab(child: Text('${maincateg[8]}', style: TextStyle(color: Colors.grey.shade600),),),

        ]),
      ),
      body: TabBarView(children: [
        Center(child: Center(child: Text('${maincateg[0]}', style: TextStyle(color: Colors.grey.shade600),)),),
        Center(child: Center(child: Text('${maincateg[1]}', style: TextStyle(color: Colors.grey.shade600),)),),
        Center(child: Center(child: Text('${maincateg[2]}', style: TextStyle(color: Colors.grey.shade600),)),),
        Center(child: Center(child: Text('${maincateg[3]}', style: TextStyle(color: Colors.grey.shade600),)),),
        Center(child: Center(child: Text('${maincateg[4]}', style: TextStyle(color: Colors.grey.shade600),)),),
        Center(child: Center(child: Text('${maincateg[5]}', style: TextStyle(color: Colors.grey.shade600),)),),
        Center(child: Center(child: Text('${maincateg[6]}', style: TextStyle(color: Colors.grey.shade600),)),),
        Center(child: Center(child: Text('${maincateg[7]}', style: TextStyle(color: Colors.grey.shade600),)),),
        Center(child: Center(child: Text('${maincateg[8]}', style: TextStyle(color: Colors.grey.shade600),)),),
      ],

      ),
    ));
  }
}


