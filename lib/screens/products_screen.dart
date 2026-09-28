import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../data/products.dart';
import '../widgets/product_card.dart';
import 'product_details_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final categories = ['All', 'Tshirts', 'Jeans', 'Shoes'];
  String selectedCategory = 'All';
  String searchText = '';

  // قائمة المنتجات مع كمياتها
  late List<CartItem> items = products.map((p) => CartItem(product: p)).toList();

  @override
  Widget build(BuildContext context) {
    // فلترة حسب التصنيف والبحث
    final filtered = items.where((item) {
      final p = item.product;
      final matchCategory =
          selectedCategory == 'All' || p.category == selectedCategory;
      final matchSearch = p.name.toLowerCase().contains(searchText.toLowerCase());
      return matchCategory && matchSearch;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Gap(16),

              // البحث + زر الفلتر
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) => setState(() => searchText = value),
                      decoration: InputDecoration(
                        hintText: 'Search for clothes...',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                    ),
                  ),
                  Gap(12),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),
              Gap(16),

              // التصنيفات
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => Gap(8),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == selectedCategory;
                    return InkWell(
                      onTap: () => setState(() => selectedCategory = category),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.grey.shade300,
                          ),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(16),

              // قائمة الكاردات
              Expanded(
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              product: item.product,
                            ),
                          ),
                        );
                      },
                      child: ProductCard(
                        product: item.product,
                        quantity: item.quantity,
                        onPlus: () => setState(() => item.quantity++),
                        onMinus: () {
                          if (item.quantity > 1) {
                            setState(() => item.quantity--);
                          }
                        },
                        onDelete: () => setState(() => items.remove(item)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}