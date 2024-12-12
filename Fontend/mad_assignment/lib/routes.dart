import 'package:get/get.dart';
import 'package:mad_assignment/views/account.dart';
import 'package:mad_assignment/views/add_product.dart';
import 'package:mad_assignment/views/cart.dart';
import 'package:mad_assignment/views/checkout.dart';
import 'package:mad_assignment/views/farmer_about.dart';
import 'package:mad_assignment/views/farmer_account.dart';
import 'package:mad_assignment/views/farmer_dashboard.dart';
import 'package:mad_assignment/views/farmer_enquiry.dart';
import 'package:mad_assignment/views/farmer_refund.dart';
import 'package:mad_assignment/views/farmer_termsConditions.dart';
import 'package:mad_assignment/views/home.dart';
import 'package:mad_assignment/views/about.dart';
import 'package:mad_assignment/views/enquiry.dart';
import 'package:mad_assignment/views/myorders.dart';
import 'package:mad_assignment/views/refund.dart';
import 'package:mad_assignment/views/shop.dart';
import 'package:mad_assignment/views/terms_conditions.dart';
import 'package:mad_assignment/views/register.dart';
import 'package:mad_assignment/views/login.dart';
import 'package:mad_assignment/views/whitelist.dart';

import 'views/farmer_login.dart';
import 'views/farmer_register.dart';
import 'views/view_product.dart';

class Routes {
  static final route = [
    GetPage(name: '/register', page: () => Register()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/about', page: () => AboutUs()),
    GetPage(name: '/enquiry', page: () => Enquiry()),
    GetPage(name: '/refund', page: () => RefundPolicy()),
    GetPage(name: '/terms', page: () => TermsConditions()),
    GetPage(name: '/shop', page: () => Shop()),
    GetPage(name: '/account', page: () => Account()),
    GetPage(name: '/order', page: () => Orders()),
    GetPage(name: '/checkout', page: () => checkOut()),
    GetPage(name: '/cart', page: () => Cart()),
    GetPage(name: '/whitelist', page: () => Whitelist()),
    GetPage(name: '/farmer_register', page: () => FarmerRegister()),
    GetPage(name: '/farmer_login', page: () => FarmerLoginPage()),
    GetPage(name: '/farmer_dashboard', page: () => FarmerDashboard()),
    GetPage(name: '/add_product', page: () => AddProduct()),
    GetPage(name: '/view_product', page: () => ViewProduct()),
    GetPage(name: '/farmer_about', page: () => FarmerAboutUs()),
    GetPage(name: '/farmer_account', page: () => FarmerAccount()),
    GetPage(name: '/farmer_enquiry', page: () => FarmerEnquiry()),
    GetPage(name: '/farmer_terms', page: () => FarmerTermsConditions()),
    GetPage(name: '/farmer_refund', page: () => FarmerRefundPolicy()),
  ];
}
