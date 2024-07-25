import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:http/http.dart' as http;

class Utility{

  static void getToast(context, icon, primaryColor,secondaryColor, textColor, String title, String des){
    MotionToast(
      icon:  icon,
      iconSize: 40,
      primaryColor:  primaryColor,
      secondaryColor:  secondaryColor,
      title:  Text(title,),
      description: Text(des),
      position:  MotionToastPosition.top,
      animationType:  AnimationType.fromTop,
      height:  100, width: 300,
      borderRadius: 0,

    ).show(context);
  }

  static Future<Map<String, dynamic>> fetchFiltersFromAPI() async {
    // Simulating API response delay
    await Future.delayed(const Duration(seconds: 2));

    // Fetch categories from API
    List categories = await fetchCategoreis();
    List<String> categoryTitles = categories.map((cat) => cat['title'] as String).toList();

    return {
      'categories': categoryTitles,
      'colors': [
        'Red', 'Blue', 'Green', 'Yellow', 'Black', 'orange', 'navy blue',
        'blackish', 'Sky blue', 'White', 'Purple', 'Yellow Print', 'White Print', 'Violet'
      ],
      'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
      'minPrice': 0.0,
      'maxPrice': 1000.0,
      'selectedMinPrice': 100.0,
      'selectedMaxPrice': 900.0,
    };
  }

  static Future<List> fetchCategoreis() async {
    try {
      final res = await http.get(Uri.parse("https://admitdoctors.com/api/doctor-categories/5"));
      return json.decode(res.body);
    } catch (err) {
      return [];
    }
  }

  static void openFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return FutureBuilder<Map<String, dynamic>>(
          future: fetchFiltersFromAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: 400, color: Colors.white.withOpacity(0.6),
                child: const Center(child: CircularProgressIndicator(color: Colors.white,)),
              );
            } else if (snapshot.hasError) {
              return SizedBox(
                height: 400, // Adjust the height as needed
                child: Center(child: Text('Error: ${snapshot.error}')),
              );
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Container(
                height: 400, color: Colors.yellow.withOpacity(0.1),
                child: const Center(child: Text('No data found')),
              );
            } else {
              final filters = snapshot.data!;
              double minPrice = filters['minPrice'];
              double maxPrice = filters['maxPrice'];
              RangeValues priceRange = RangeValues(
                filters['selectedMinPrice'],
                filters['selectedMaxPrice'],
              );
              List<String> selectedCategories = [];
              List<String> selectedColors = [];
              List<String> selectedSizes = [];

              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.75, // Adjust the height as needed
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.white.withOpacity(0.8),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Filter Options',
                            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Categories',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Wrap(
                            spacing: 8.0,
                            children: filters['categories'].map<Widget>((category) {
                              return FilterChip(
                                label: Text(category),
                                selected: selectedCategories.contains(category),
                                onSelected: (bool selected) {
                                  setState(() {
                                    if (selected) {
                                      selectedCategories.add(category);
                                    } else {
                                      selectedCategories.remove(category);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Price Range',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          RangeSlider(
                            values: priceRange,
                            min: minPrice,
                            max: maxPrice,
                            divisions: 100,
                            labels: RangeLabels(
                              '\$${priceRange.start.round()}',
                              '\$${priceRange.end.round()}',
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                priceRange = values;
                              });
                            },
                          ),
                          const SizedBox(height: 16.0),
                          const Text( 'Colors',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Wrap(
                            spacing: 8.0,
                            children: filters['colors'].map<Widget>((color) {
                              return FilterChip(
                                label: Text(color),
                                selected: selectedColors.contains(color),
                                onSelected: (bool selected) {
                                  setState(() {
                                    if (selected) {
                                      selectedColors.add(color);
                                    } else {
                                      selectedColors.remove(color);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16.0),
                          const Text( 'Sizes',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Wrap(
                            spacing: 8.0,
                            children: filters['sizes'].map<Widget>((size) {
                              return FilterChip(
                                label: Text(size),
                                selected: selectedSizes.contains(size),
                                onSelected: (bool selected) {
                                  setState(() {
                                    if (selected) {
                                      selectedSizes.add(size);
                                    } else {
                                      selectedSizes.remove(size);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    print(selectedColors);
                                  },
                                  child: const Text('Apply Filters'),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategories.clear();
                                      selectedColors.clear();
                                      selectedSizes.clear();
                                      priceRange = RangeValues(minPrice, maxPrice);
                                    });
                                    // Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                  ),
                                  child: const Text('Clear Filters'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }




  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }


}

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 30, 0);
    path.lineTo(size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


