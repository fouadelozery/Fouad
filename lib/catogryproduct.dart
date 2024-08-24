import 'package:flutter/material.dart';
import 'package:flutterf/ApiProvider.dart';

class Catogryproduct extends StatefulWidget {
  const Catogryproduct({super.key});

  @override
  State<Catogryproduct> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Catogryproduct> {
  List<String> categories = [];
  List<String> products = [];
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      List<String> fetchedCategories = await ApiProvider().fetchCategories();
      setState(() {
        categories = fetchedCategories;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _loadProducts(String category) async {
    try {
      List<String> fetchedProducts =
          await ApiProvider().fetchProducts(category);
      setState(() {
        products = fetchedProducts;
        selectedCategory = category;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories and Products'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {
                    _loadProducts(categories[index]);
                  },
                  child: Text(categories[index]),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
