import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// بيانات العنوان الواحد
class Address {
  const Address({
    required this.title,
    required this.details,
    this.isDefault = false,
  });

  final String title;
  final String details;
  final bool isDefault;
}

const List<Address> addresses = [
  Address(
    title: 'Home',
    details: '925 S Chugach St #APT 10, Alaska 99645',
    isDefault: true,
  ),
  Address(title: 'Office', details: '2438 6th Ave, Ketchikan, Alaska 99901'),
  Address(title: 'Apartment', details: '2551 Vista Dr #B301, Juneau, Alaska 99801'),
  Address(title: "Parent's House", details: '4821 Ridge Top Cir, Anchorage, Alaska 99508'),
];

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // سهم الرجوع بيظهر أوتوماتيك وبيرجعك لشاشة Account
      appBar: AppBar(
        title: Text(
          'Address',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        scrolledUnderElevation: 0,
      ),

      body: Column(
        children: [
          Divider(height: 1, indent: 24, endIndent: 24),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(24),
              children: [
                Text(
                  'Saved Address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Gap(12),

                // كرت لكل عنوان
                for (final address in addresses)
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.fromLTRB(35, 16, 16, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 24,
                        ),
                        Gap(14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    address.title,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (address.isDefault) Gap(8),
                                  if (address.isDefault)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        'Default',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Gap(4),
                              Text(
                                address.details,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}