import 'package:final_exam/model/vegetable.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VegetableDetailScreen extends StatelessWidget {
  Vegetables vegetables;

  VegetableDetailScreen({
    Key? key,
    required this.vegetables,
  }) : super(key: key);

  //late VegetableStore agent;
  @override
  Widget build(BuildContext context) {
    //agent = Provider.of<VegetableStore>(context);

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          vegetables.name,
          style: const TextStyle(color: Colors.green),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          // image
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: NetworkImage(vegetables.url), fit: BoxFit.cover)
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                Text('\$${vegetables.price}',style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // detail
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(child: Text(vegetables.description)),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          // button
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.green[500],
              borderRadius: BorderRadius.circular(15)
            ),
            child: const Center(child: Text("ADD", style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    );
  }
}
