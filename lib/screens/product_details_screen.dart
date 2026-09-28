import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../data/products.dart';
import '../widgets/custom_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    // المنتج اللي انبعت من شاشة الـ Home
    //final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            SizedBox(
              height: 320,
              width: double.infinity,
              child: Image.asset(
                product.image,
                fit: BoxFit.fill,
              ),
            ),
            Gap(24),

            // Name
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Gap(6),

            // Rating (قيمة ثابتة للتجربة)
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                Gap(4),
                Text('4.0/5', style: TextStyle(fontWeight: FontWeight.w600,decoration:TextDecoration.underline)),
                Gap(4),
                Text('(45 Reviews)', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey)),
              ],
            ),
            Gap(12),

            Text(
              'Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them',
              style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
            ),
          ],
        ),
      ),

      // Price + Add to Cart
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price', style: TextStyle(color: Colors.grey)),
                    Text(
                      formatPrice(product.price),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Gap(24),
                Expanded(
                  child: CustomButton(
                    text: 'Add to Cart',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} added to cart')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}