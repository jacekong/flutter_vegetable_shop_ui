import 'package:final_exam/utils/central_store.dart';
import 'package:final_exam/utils/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({super.key});

  late VegetableStore agent;
  @override
  Widget build(BuildContext context) {
    agent = Provider.of<VegetableStore>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: agent.carts.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // image
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              agent.carts[index].url),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // title
                                // ignore: prefer_const_constructors
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 15),
                                  child: Text(
                                    agent.carts[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                // price
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 15),
                                  child: Text(
                                    agent.carts[index].price.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                // remove button
                                GestureDetector(
                                  onTap: () {
                                    agent.removeProduct(agent.carts[index]);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.green[100],
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                // quantity
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child:
                                      Text(agent.carts[index].qty.toString()),
                                ),
                                // adding button
                                GestureDetector(
                                  onTap: () {
                                    agent.addProduct(agent.carts[index]);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Icon(Icons.add,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total quantity: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(agent.getTotalSize().toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total price: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$${agent.getTotalPrice().toStringAsFixed(2)}'),
                  ],
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    //move to new creen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                        child: Text(
                      "CHECKOUT",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
