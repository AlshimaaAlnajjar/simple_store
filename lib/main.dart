// نقطة البداية: نشغل التطبيق ونحدد أول شاشة والثيم.
import 'package:flutter/material.dart';
import 'package:store/data/products.dart';
import 'package:store/screens/account_screen.dart';
import 'package:store/screens/address_screen.dart';
import 'package:store/screens/cart_screen.dart';
import 'package:store/screens/main_screen.dart';
import 'package:store/screens/product_details_screen.dart';
import 'package:store/screens/signup_screen.dart';
import 'package:store/widgets/product_card.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: Scaffold(
      //   body: Center(
      //     child: ProductWidget(
      //       product: Product(
      //         name: "Fit Polo T Shirt",
      //         price: 1190,
      //         image: "assets/images/img2.png",
      //         category: "Tshirts",
      //       ),
      //       //size: 'L',
      //       //quantity: 1,
      //       onDelete: () {},
      //       onIncrease: () {},
      //       onDecrease: () {},
      //     ),
      //   ),
      // ),
      initialRoute: '/main_screen',
      routes: {
        '/login_screen': (context) => LoginScreen(),
        '/signup_screen': (context) => SignupScreen(),
        '/main_screen': (context) => MainScreen(),
        //'/details_screen': (context) => ProductDetailsScreen(),
        '/account_screen': (context) => AccountScreen(),
        '/address_screen': (context) => AddressScreen(),

      },
    );
  }
}
