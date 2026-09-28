import 'package:intl/intl.dart';

// كلاسان بسيطان للبيانات: Product للمنتج وCartItem للمنتج مع كميته.
// كل منتج له اسم وسعر وصورة. هذا الكلاس لتجميع بياناته فقط.
class Product {
  const Product({
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    this.size = 'L',
  });

  final String name;
  final int price;
  final String image;
  final String category;
  final String size;
}

// عنصر السلة = المنتج + عدد القطع.
class CartItem {
  CartItem({required this.product, this.quantity = 1});

  final Product product;
  int quantity;
}

const List<Product> products = [
  Product(
    name: 'Shoes',
    price: 1100,
    image: 'assets/images/img1.png',
    category: 'Shoes',
    size: 'M',
  ),
  Product(
    name: 'Fit Polo T Shirt',
    price: 1190,
    image: 'assets/images/img2.png',
    category: 'Tshirts',
  ),
  Product(
    name: 'Regular Fit Black',
    price: 1690,
    image: 'assets/images/img2.png',
    category: 'Tshirts',
  ),
  Product(
    name: 'Regular Fit V-Neck',
    price: 1290,
    image: 'assets/images/img1.png',
    category: 'Shoes',
  ),
  Product(
    name: 'Running Shoes',
    price: 1490,
    image: 'assets/images/img1.png',
    category: 'Shoes',
  ),
  Product(
    name: 'Classic T Shirt',
    price: 1250,
    image: 'assets/images/img2.png',
    category: 'Tshirts',
  ),
];

// مثال: نحول 1190 إلى $ 1,190
String formatPrice(int price) {
  return NumberFormat.currency(symbol: '\$ ', decimalDigits: 0).format(price);
}
