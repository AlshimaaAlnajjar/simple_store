/*
  THIS IS PREVIOUS HOME SCREEN DESIGN (GRID VIEW)
 */









import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/screens/product_details_screen.dart';
import '../data/products.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  final List<String> categories = ['All', 'Tshirts', 'Jeans', 'Shoes'];
  String selectedCategory = 'All';
  String searchText = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // فلترة المنتجات حسب التصنيف والبحث
    final filteredProducts = products.where((p) {
      final matchCategory =
          selectedCategory == 'All' || p.category == selectedCategory;
      final matchSearch = p.name.toLowerCase().contains(
        searchText.toLowerCase(),
      );
      return matchCategory && matchSearch;
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Gap(16),

              // Search + Filter button
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() => searchText = value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search here...',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Gap(12),
                  InkWell(
                    onTap: () {
                      print('filter tapped');
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.tune, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Gap(16),

              // Categories
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == selectedCategory;
                    return InkWell(
                      onTap: () {
                        setState(() => selectedCategory = category);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.grey.shade200,
                          ),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 14,
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

              // Products grid
              Expanded(
                child: filteredProducts.isEmpty
                    ? Center(child: Text('No products found'))
                    : GridView.builder(
                        itemCount: filteredProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return InkWell(
                            onTap: () {
                              //Navigator.pushNamed(context, '/details_screen',arguments: product);
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductDetailsScreen(product: product,)));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      product.image,
                                      fit: BoxFit.fill,
                                      // لحد ما تضيف الصور بيظهر هاد الآيكون
                                      // errorBuilder: (context, error, stack) {
                                      //   return Icon(
                                      //     Icons.image_outlined,
                                      //     size: 40,
                                      //     color: Colors.grey,
                                      //  );
                                      //},
                                    ),
                                  ),
                                ),
                                Gap(8),
                                Text(
                                  product.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Gap(2),
                                Text(
                                  formatPrice(product.price),
                                  style: TextStyle(
                                    fontSize: 12
                                    ,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
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
