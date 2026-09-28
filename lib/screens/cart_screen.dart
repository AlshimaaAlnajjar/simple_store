import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../data/products.dart';
import '../widgets/product_card.dart';
import '../widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // بيانات تجريبية: أول منتجين بالسلة
  List<CartItem> items = [
    CartItem(product: products[0]),
    CartItem(product: products[1], quantity: 2),
  ];

  final int shipping = 80;

  // مجموع أسعار المنتجات
  int get subTotal {
    int sum = 0;
    for (var item in items) {
      sum += item.product.price * item.quantity;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            // قائمة المنتجات
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ProductCard(
                    product: item.product,
                    quantity: item.quantity,
                    onPlus: () => setState(() => item.quantity++),
                    onMinus: () {
                      if (item.quantity > 1) {
                        setState(() => item.quantity--);
                      }
                    },
                    onDelete: () => setState(() => items.remove(item)),
                  );
                },
              ),
            ),

            // ملخص الأسعار
            _priceRow('Sub-total', formatPrice(subTotal)),
            Gap(12),
            _priceRow('VAT (%)', formatPrice(0)),
            Gap(12),
            _priceRow('Shipping fee', formatPrice(shipping)),
            Divider(height: 32),
            _priceRow('Total', formatPrice(subTotal + shipping), bold: true),
            Gap(24),

            // زر الدفع
            CustomButton(
              text: 'Go To Checkout',
              icon: Icons.arrow_forward,
              onTap: () {},
            ),
            Gap(24),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String title, String value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: bold ? Colors.black : Colors.grey,
          ),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}