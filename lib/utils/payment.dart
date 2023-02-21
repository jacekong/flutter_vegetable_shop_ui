import 'package:final_exam/utils/central_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  late VegetableStore agent;

  @override
  Widget build(BuildContext context) {
    agent = Provider.of<VegetableStore>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 31, 61),
      appBar: AppBar(
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.green[200]),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // name
          const Text(
            "Jace's bill checking",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green[300]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: QrImage(
                    data: agent.getTotalPrice().toString(),
                    version: QrVersions.auto,
                    size: 200.0, //default size
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: agent.carts.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(agent.carts[index].name, style: s1),
                          Text(agent.carts[index].price.toString(), style: s1),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Text("Total: \$${agent.getTotalPrice().toStringAsFixed(2)}", style: s1,),
          const SizedBox(height: 30,),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.green[500],
              borderRadius: BorderRadius.circular(15)
            ),
            child: const Center(child: Text("CONFIRM",style: TextStyle(color: Colors.white),)),
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}

TextStyle s1 = TextStyle(
    fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green[700]);
