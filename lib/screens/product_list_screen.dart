import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../services/api_service.dart';
import '../widgets/product_tile.dart';
import '../widgets/filter_drawer.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> allProducts = [];
  List<Product> displayedProducts = [];
  String searchQuery = '';
  String selectedCategory = ''; // Track the selected category

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    final products = await ApiService.fetchProducts();
    setState(() {
      allProducts = products;
      displayedProducts = products;
    });
  }

  void filterProducts(String query, String category) {
    List<Product> filtered = allProducts.where((product) {
      final matchesQuery = product.title.toLowerCase().contains(query.toLowerCase());
      final matchesCategory = category.isEmpty || product.title.toLowerCase().contains(category.toLowerCase());
      return matchesQuery && matchesCategory;
    }).toList();

    setState(() {
      searchQuery = query;
      selectedCategory = category; // Update selected category
      displayedProducts = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) => filterProducts(value, selectedCategory),
            ),
          ),
        ),
      ),
      drawer: FilterDrawer(
        categories: ['electronics', 'jewelery', "men's clothing", "women's clothing"],
        selectedCategory: selectedCategory, // Pass the selected category
        onSelect: (category) => filterProducts(searchQuery, category),
      ),
      body: displayedProducts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: displayedProducts.length,
              itemBuilder: (context, index) => ProductTile(displayedProducts[index]),
            ),
    );
  }
}
