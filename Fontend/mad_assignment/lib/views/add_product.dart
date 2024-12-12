import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/controllers/shop/addProductController.dart';

import 'package:mad_assignment/controllers/user/account_controller.dart';

// ignore: must_be_immutable
class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  AccountController accountController = AccountController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController user_idController = TextEditingController();
  AddProductController productController = AddProductController();

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
                        onPressed: () {
                          Get.toNamed('/farmer_terms');
                        },
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
                          // Get.toNamed('/add_product');
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
                        onPressed: () {},
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
        child: Center(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 235, 235),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Text(
                      "ADD Product",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    // Product Name
                    TextField(
                      onChanged: (value) =>
                          productController.name.value = value,
                      decoration: const InputDecoration(
                          labelText: "Enter Product Name"),
                    ),
                    // Product Price
                    TextField(
                      onChanged: (value) =>
                          productController.price.value = value,
                      decoration: const InputDecoration(
                          labelText: "Enter Product Price"),
                    ),
                    const SizedBox(height: 10),

                    // Product Description
                    TextField(
                      onChanged: (value) =>
                          productController.description.value = value,
                      decoration: const InputDecoration(
                          labelText: "Product Description"),
                    ),

                    // Hidden Field for user ID
                    TextField(
                      controller: TextEditingController(
                          text: productController.userId.value),
                      decoration: const InputDecoration(
                        hintText: 'Hidden Field',
                        enabled: false, // Disable editing
                        border: InputBorder.none, // Remove border
                      ),
                      obscureText: true, // Make the text visually hidden
                    ),

                    // Display the selected image
                    Obx(() {
                      return productController.image.value != null
                          ? Image.file(
                              productController.image.value!,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          : const SizedBox(
                              height: 50, width: 50, child: Placeholder());
                    }),

                    // Button to pick image
                    ElevatedButton(
                      onPressed: productController.pickImage,
                      child: const Text('Select Product Image'),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: productController
                            .submitProductData, // Submit the data
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color.fromARGB(255, 18, 7, 7)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Follow Us section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 81, 233),
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
            ],
          ),
        ),
      ),
    );
  }
}
