import 'package:final_exam/pages/bottom_nav.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[700]),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: const [
            
          ],
        ),
        // drawer
        drawer: Drawer(
          child: Container(
            color: Colors.green[100],
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                      child: Text("Welcome,Jace!",
                          style: TextStyle(
                              fontSize: 30, color: Colors.green[700]))),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    //move to new creen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNav(),
                      ),
                    );
                  },
                ),
                const ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text("Address"),
                ),
                const ListTile(
                  leading: Icon(Icons.payment),
                  title: Text("Payment"),
                ),
                const ListTile(
                  leading: Icon(Icons.language),
                  title: Text("Language"),
                ),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            //avatar
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                ],
              ),
            ),
            // name
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Welcome Jace!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // my orders
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.shopify_sharp),
                  ),
                ),
                const Text("My Orders",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // my orders
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.wallet),
                  ),
                ),
                const Text("Wallet",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // my orders
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.mark_email_read_outlined),
                  ),
                ),
                const Text("Vouchers",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // my orders
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.location_on_outlined),
                  ),
                ),
                const Text("My Address",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // my orders
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.login),
                  ),
                ),
                const Text("Log out",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
