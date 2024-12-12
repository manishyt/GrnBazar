import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/controllers/user/account_controller.dart';
import 'package:mad_assignment/controllers/terms_conditions/terms_conditions_controller.dart';
// import 'package:mad_assignment/api/terms&conditions_api.dart';

// ignore: must_be_immutable
class FarmerTermsConditions extends StatelessWidget {
  FarmerTermsConditions({super.key});
  AccountController accountController = AccountController();
  TermsConditionsController termsController = TermsConditionsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fixed color instantiation
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text("Dashboard",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed('/farmer_account');
                    },
                    icon: const Icon(Icons.account_box_rounded)),
              ],
            )
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Info & Links",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed('/farmer_refund');
                        },
                        icon: const Icon(Icons.policy_outlined),
                        label: const Text(
                          "Refund",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.run_circle_sharp),
                        label: const Text(
                          "Terms",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
              ];
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: FutureBuilder(
          future: accountController.fetchAccount(),
          builder: (context, snapshot) => ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 200, 245, 245),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png',
                      bundle: PlatformAssetBundle()),
                ), // Fixed CircleAvatar widget
              ),
              ListTile(
                title: Text(
                    "${accountController.accountList[0].firstName.toUpperCase()} ${accountController.accountList[0].lastName.toUpperCase()}"),
                leading: const Icon(Icons.person),
              ),
              ListTile(
                title: Text(accountController.accountList[0].email.toString()),
                leading: const Icon(Icons.mail),
              ),
              const Divider(
                height: 0.2,
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
                        onPressed: () {
                          Get.toNamed('/farmer_enquiry');
                        },
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
              ListTile(
                title: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.toNamed('/login');
                        },
                        child: const Text(
                          "LogOut",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                leading: const Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const Text(
              "Our Terms & Conditions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              textAlign: TextAlign.center,
            ),

            Container(
              // Set width based on screen width
              height: 400, // Set height based on screen height
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 239, 239),
                borderRadius: BorderRadius.circular(15),
              ),
              child: FutureBuilder(
                future: termsController
                    .fetchTerms(), // Replace with your future data-fetching function
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                        itemCount: termsController.termsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              termsController.termsList[index].title.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(termsController
                                .termsList[index].description
                                .toString()),
                          );
                        },
                      );
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),

// ... (other parts of the code)

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 58, 80, 190),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: const Text(
                  "Follow Us",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color: const Color.fromARGB(255, 236, 236, 235),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook_rounded),
                          label: const Text("")),
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.auto_awesome_outlined),
                          label: const Text("")),
                    ],
                  )),
            ),
            const SizedBox(
                child: Text(
              "Copyright 2023-ALL RIGHTS RESERVED",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}
