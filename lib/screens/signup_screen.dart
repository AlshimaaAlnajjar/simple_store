import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/custom_button.dart';
import '../widgets/store_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //كلمة final معناها إن المفتاح ما بنغيره بعد ما ننشئه، بنستخدمه بس.
  //هذا "مفتاح" بتربطه بالـ Form. بيسمحلك توصل لحالة الفورم من أي مكان بالكود
  final formKey = GlobalKey<FormState>();

  //الـ controller هو اللي بيخليك تتحكم بالنص اللي بالحقل.
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  /*
  الـ dispose بتنادى أوتوماتيك لما الشاشة تنشال من الذاكرة (مثلاً لما المستخدم يطلع منها). الـ controllers بتحجز موارد بالذاكرة، فلازم نحررها بإيدنا، وإلا بيصير memory leak، يعني ذاكرة بتضل محجوزة بلا فايدة
وأما super.dispose() فبنحطها بالآخر عشان الكلاس الأب يكمل التنظيف تبعه
  قاعدة بسيطة: أي controller بتنشئه بالـ State، لازم تعمله dispose
   */
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40, left: 24, right: 24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an account',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Gap(8),
                Text(
                  "Let's create your account.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Gap(24),

                // Full Name
                StoreTextField(
                  label: 'Full Name',
                  hint: 'Enter your full name',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Full name is required';
                    }
                    return null;
                  },
                ),
                Gap(16),

                // Email
                StoreTextField(
                  label: 'Email',
                  hint: 'Enter your email address',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
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
                Gap(16),

                // Confirm Password
                StoreTextField(
                  label: 'Confirm Password',
                  hint: 'Enter your password',
                  controller: confirmController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                Gap(40),

                // Create Account button
                CustomButton(
                  text: 'Create Account',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, '/main_screen');
                    }
                  },
                ),
                Gap(24),
              ],
            ),
          ),
        ),
      ),

      // "Already have an account? Log In" ثابتة تحت الشاشة
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 16, top: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Log In',
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