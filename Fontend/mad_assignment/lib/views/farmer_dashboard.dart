import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/controllers/user/account_controller.dart';
import 'package:mad_assignment/controllers/refund/refund_controller.dart';

class FarmerDashboard extends StatelessWidget {
  FarmerDashboard({super.key});
  RefundController refundController = RefundController();
  AccountController accountController = AccountController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("GrnBazar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
          ],
        ),
      ),
      drawer: Drawer(
        child: FutureBuilder(
          future: accountController.fetchAccount(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView(
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 200, 245, 245),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.toNamed('/add_product');
                              },
                              child: const Text(
                                "Add Product",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      leading: const Icon(Icons.shop_2_rounded),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.toNamed('/view_product');
                              },
                              child: const Text(
                                "View Product",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      leading: const Icon(Icons.production_quantity_limits),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.toNamed('/farmer_dashboard');
                              },
                              child: const Text(
                                "History",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      leading: const Icon(Icons.history),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.toNamed('/farmer_about');
                              },
                              child: const Text(
                                "About",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      leading: const Icon(Icons.contact_support_sharp),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Contact",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                      leading: const Icon(Icons.contact_emergency),
                    ),
                  ],
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        // Wrapping the Column in a SingleChildScrollView
        padding: const EdgeInsets.all(15.0), // Applied padding here
        child: Column(
          children: [
            const Text(
              "Transaction History",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Static Table of Transaction Data
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Order ID')),
                  DataColumn(label: Text('User ID')),
                  DataColumn(label: Text('Total Bill')),
                  DataColumn(label: Text('Payment Method')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('001')),
                    DataCell(Text('1001')),
                    DataCell(Text('Rs. 1200')),
                    DataCell(Text('Credit Card')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('002')),
                    DataCell(Text('1002')),
                    DataCell(Text('Rs. 800')),
                    DataCell(Text('PayPal')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('003')),
                    DataCell(Text('1003')),
                    DataCell(Text('Rs. 1500')),
                    DataCell(Text('Debit Card')),
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Additional Content for the Page (Optional)
          ],
        ),
      ),
    );
  }
}
