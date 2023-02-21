import 'package:badges/badges.dart';
import 'package:final_exam/utils/central_store.dart';
import 'package:final_exam/utils/vegtables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  late VegetableStore agent;

  @override
  Widget build(BuildContext context) {
    agent = Provider.of<VegetableStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hi, Jace!",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Badge(
                toAnimate: false,
                //shape: BadgeShape.square,
                badgeColor: Colors.green,
                //borderRadius: BorderRadius.circular(4),
                badgeContent: Text(agent.getTotalSize().toString(), style: const TextStyle(color: Colors.white),),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.shopping_cart_outlined, color: Colors.black,),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          //subtitle
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "whay would you buy today?",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          const SizedBox(height: 20),
          // promotion hint
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text("Enjoy the special offer",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                    const Text("up to 60%",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // categories / using tab control to show
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 1,
            child: VegetablePage(),
          ),
        ],
      ),
    );
  }
}
