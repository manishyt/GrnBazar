import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mad_assignment/controllers/user/account_controller.dart';

// ignore: must_be_immutable
class FarmerAccount extends StatelessWidget {
  FarmerAccount({super.key});
  var box = GetStorage();

  AccountController accountController = AccountController();

  UpdateAccountController updateRegisterController = UpdateAccountController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();

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
                    onPressed: () {},
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
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 200, 245, 245),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://unsplash.com/photos/two-donuts-CoNsEK5iHug'),
                ),
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
      body: FutureBuilder(
          future: accountController.fetchAccount(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: accountController.accountList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: Get.height * 5,
                    width: Get.width * 5,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100, // Set the desired height
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            radius: 50, // Set half of the desired height
                            backgroundImage: AssetImage('assets/logo.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Account",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          color: const Color.fromARGB(255, 241, 241, 229),
                          elevation: 4,
                          clipBehavior: Clip.antiAlias,
                          child: TextField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                                hintText:
                                    "First Name: ${accountController.accountList[index].firstName}"),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                            focusNode: FocusNode(),
                          ),
                        ),
                        Card(
                          color: const Color.fromARGB(255, 241, 241, 229),
                          elevation: 4,
                          clipBehavior: Clip.antiAlias,
                          child: TextField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                                hintText:
                                    "Last Name: ${accountController.accountList[index].lastName}"),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                            focusNode: FocusNode(),
                          ),
                        ),
                        Card(
                          color: const Color.fromARGB(255, 241, 241, 229),
                          elevation: 4,
                          clipBehavior: Clip.antiAlias,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText:
                                    "Email: ${accountController.accountList[index].email}"),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                            focusNode: FocusNode(),
                          ),
                        ),
                        Card(
                          color: const Color.fromARGB(255, 241, 241, 229),
                          elevation: 4,
                          clipBehavior: Clip.antiAlias,
                          child: TextField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                                hintText:
                                    "Phone Number: ${accountController.accountList[index].phoneNumber}"),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                            focusNode: FocusNode(),
                          ),
                        ),
                        Card(
                          color: const Color.fromARGB(255, 241, 241, 229),
                          elevation: 4,
                          clipBehavior: Clip.antiAlias,
                          child: TextField(
                            controller: countryController,
                            decoration: InputDecoration(
                                hintText:
                                    "Country: ${accountController.accountList[index].country}"),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                            focusNode: FocusNode(),
                          ),
                        ),
                        Card(
                          color: const Color.fromARGB(255, 241, 241, 229),
                          elevation: 4,
                          clipBehavior: Clip.antiAlias,
                          child: TextField(
                            controller: cityController,
                            decoration: InputDecoration(
                                hintText:
                                    "City: ${accountController.accountList[index].city}"),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                            focusNode: FocusNode(),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                updateRegisterController.updateUser(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    phoneNumber: phoneNumberController.text,
                                    country: countryController.text,
                                    city: cityController.text);
                              },
                              style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Color.fromARGB(255, 0, 0, 0)),
                                  foregroundColor: WidgetStatePropertyAll(
                                      Color.fromARGB(255, 250, 250, 250))),
                              child: const Text(
                                "Update",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed('/home');
                              },
                              style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Color.fromARGB(255, 1, 1, 1)),
                                  foregroundColor: WidgetStatePropertyAll(
                                      Color.fromARGB(255, 246, 242, 242))),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
