import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // الدايرة الحمراء مع علامة التعجب
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 3),
                  ),
                  child: Icon(Icons.priority_high, color: Colors.red, size: 30),
                ),
                SizedBox(height: 16),

                Text(
                  'Logout?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Are you sure you want to logout?',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 24),

                // Yes, Logout
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // بيرجع لشاشة Login وبيمسح كل الشاشات اللي قبلها
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/login_screen',
                            (route) => false,
                      );
                    },
                    child: Text('Yes, Logout'),
                  ),
                ),
                SizedBox(height: 12),

                // No, Cancel
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // بيسكّر النافذة بس
                      Navigator.pop(context);
                    },
                    child: Text('No, Cancel'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // العنوان
            Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(height: 1, indent: 24, endIndent: 24),

            // My Orders
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: Icon(Icons.inventory_2_outlined, size: 20),
              title: Text('My Orders'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),

            // فاصل سميك
            Container(height: 8, color: Colors.grey.shade400),

            // My Details
            ListTile(
              mouseCursor: SystemMouseCursors.click,
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: Icon(Icons.assignment_ind_outlined, size: 20),
              title: Text('My Details'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
            Divider(height: 1, indent: 60, endIndent: 24),

            // Address Book
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: Icon(Icons.home_outlined, size: 20),
              title: Text('Address Book'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () { Navigator.pushNamed(context, '/address_screen');},
            ),
            Divider(height: 1, indent: 60, endIndent: 24),

            // FAQs
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: Icon(Icons.help_outline, size: 20),
              title: Text('FAQs'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
            Divider(height: 1, indent: 60, endIndent: 24),

            // Help Center
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: Icon(Icons.headset_mic_outlined, size: 20),
              title: Text('Help Center'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),

            // فاصل سميك
            Container(height: 8, color: Colors.grey.shade200),

            // Logout
            Spacer(),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: Icon(Icons.logout, size: 20, color: Colors.red),
              title: Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () { showLogoutDialog(context);
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}