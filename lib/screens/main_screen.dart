import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'products_screen.dart';
import 'cart_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  // بدّل الـ Center بشاشة Cart وشاشة Account لما نعملهم
  final List<Widget> pages = [
    //HomeScreen(),
    ProductsScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              heightFactor: 1,
              child: SizedBox(
                // العرض هو اللي بيتحكم بالمسافة بين العناصر
                width: 220,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: currentIndex,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey.shade600,
                  selectedLabelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(fontSize: 12),
                  onTap: (index) {
                    setState(() => currentIndex = index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined),
                      label: 'Cart',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_outlined),
                      label: 'Account',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}