import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widgets/custom_button.dart';
import '../widgets/store_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 59, left: 24, right: 24),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login to your account',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Gap(8),
              Text(
                "It's great to see you again.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Gap(24),

              // Email
            StoreTextField(
                label: 'Email',
                hint: 'Enter your email address',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email is required';
                  if (!value.contains('@')) return 'Enter a valid email';
                  return null;
                },
              ),
              Gap(16),

              // Password
              StoreTextField(
                label: 'Password',
                hint: 'Enter your password',
                controller: passwordController,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) return 'At least 6 characters';
                  return null;
                },
              ),
              Gap(55),

              CustomButton(
                text: 'Sign In',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/main_screen');
                  }
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 16, top: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/signup_screen');
                },
                child: Text(
                  'Join',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
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