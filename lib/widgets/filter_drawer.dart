import 'package:flutter/material.dart';

class FilterDrawer extends StatelessWidget {
  final List<String> categories;
  final Function(String) onSelect;

  const FilterDrawer({super.key, required this.categories, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text("Filter by Category", style: TextStyle(fontSize: 18))),
          ...categories.map((category) => ListTile(
                title: Text(category),
                onTap: () {
                  onSelect(category);
                  Navigator.pop(context);
                },
              ))
        ],
      ),
    );
  }
}
