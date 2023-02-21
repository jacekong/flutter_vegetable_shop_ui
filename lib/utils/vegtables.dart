import 'package:final_exam/model/vegetable.dart';
import 'package:final_exam/utils/central_store.dart';
import 'package:final_exam/utils/veg_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class VegetablePage extends StatelessWidget {
  VegetablePage({super.key});

  late VegetableStore agent;
  @override
  Widget build(BuildContext context) {
    //store reference
    agent = Provider.of<VegetableStore>(context);

    return Scaffold(
      body: FutureBuilder<List<Vegetables>>(
        future: agent.fetchData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            //return progress
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            //return widget
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: agent.vegetable.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            // image
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: GestureDetector(
                                onTap: () {
                                  //move to new creen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          VegetableDetailScreen(
                                              vegetables:
                                                  agent.vegetable[index]),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              agent.vegetable[index].url),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // title
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 15),
                                    child: Text(
                                      agent.vegetable[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  // description
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      // ignore: prefer_const_constructors
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 5),
                                          child: Text(agent
                                              .vegetable[index].description),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // price
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, top: 7),
                                    // ignore: prefer_interpolation_to_compose_strings
                                    child: Text(
                                      "\$" +
                                          agent.vegetable[index].price
                                              .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // add button
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  agent.addProduct(agent.vegetable[index]);
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
