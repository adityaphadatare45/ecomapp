import 'package:flutter/material.dart';

class FilterDrawer extends StatelessWidget {
  final List<String> categories;
  final Function(String) onSelect;
  final String selectedCategory; // Track selected category

  // Update constructor to accept selectedCategory
  const FilterDrawer({
    super.key,
    required this.categories,
    required this.onSelect,
    required this.selectedCategory, // Add this to pass the selected category
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text("Filter by Category", style: TextStyle(fontSize: 18))),
          // Loop through categories and create ListTile for each
          ...categories.map((category) => ListTile(
            title: Text(category),
            tileColor: selectedCategory == category
                ? Colors.blue.shade100  // Highlight selected category
                : null,
            onTap: () {
              onSelect(category); // Call onSelect when category is tapped
              Navigator.pop(context); // Close the drawer
            },
            textColor: Colors.black,
          )),
        ],
      ),
    );
  }
}
