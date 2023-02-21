import 'package:final_exam/utils/maps.dart';
import 'package:final_exam/utils/notes.dart';
import 'package:flutter/material.dart';

class WillList extends StatefulWidget {
  WillList({super.key});

  @override
  State<WillList> createState() => _WillListState();
}

class _WillListState extends State<WillList> with TickerProviderStateMixin{

  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Will List",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // tab bar 
          Align(
            alignment: Alignment.center,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.green,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black, 
              indicatorColor: Colors.transparent,
              isScrollable: true,         
              tabs: const [
                Tab(text: "Notes"),
                Tab(text: "Maps"),
              ]
            ),
          ),
          // tab bar view
          // SizedBox(height: 7,),
          Expanded(
            child: Container(
              color: Colors.white,
              child: TabBarView(  
                controller: _tabController,
                children: [
                  Notes(),
                  Maps(),
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
