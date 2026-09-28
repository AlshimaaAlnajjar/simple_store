import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../data/products.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.onPlus,
    required this.onMinus,
    required this.onDelete,
  });

  final Product product;
  final int quantity;
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:107,
      width:342,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset(
              product.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          Gap(12),

          // الاسم + الحجم + السعر
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Size ${product.size}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Gap(8),
                Text(
                  formatPrice(product.price),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // زر الحذف + الكمية
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: onDelete,
                child: Icon(Icons.delete_outline, color: Colors.red, size: 18),
              ),
              Gap(16),
              Row(
                children: [
                  _qtyButton(Icons.remove, onMinus),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('$quantity'),
                  ),
                  _qtyButton(Icons.add, onPlus),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // زر صغير للزيادة أو النقصان
  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 14),
      ),
    );
  }
}