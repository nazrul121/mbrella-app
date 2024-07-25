import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mbrella/product/categoryItems.dart';


class CatList extends StatefulWidget {
  const CatList({super.key});

  @override
  State<CatList> createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  bool _isLoading = false;
  // List _categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategoreis();
  }

  void _fetchCategoreis() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      setState(() {
        // _categories = json.decode(res.body);
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong in FirstLoad');
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  final List<Map<String, dynamic>> _categories = [
    {'title': 'Category 1', 'image': 'https://mbrellabd.com/storage/images/category/1650259068.jpg'},
    {'title': 'Category 2', 'image': 'https://mbrellabd.com/storage/images/category/1703079257.webp'},
    {'title': 'Category 3', 'image': 'https://mbrellabd.com/storage/images/category/1703079087.webp'},
    {'title': 'Category 4', 'image': 'https://mbrellabd.com/storage/images/category/1700715529.jpg'},
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(top: 0,bottom: 10,left: 10,right: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle the onTap event here
              print('Tapped on ${_categories[index]['title']}');
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => CategoryItems(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );

            },
            child: GridTile(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_categories[index]['image']),
                        fit: BoxFit.cover,
                        onError: (error, stackTrace) {
                          // Handle image load error
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        _categories[index]['title'].toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
