import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(child: Image.network(product.image, fit: BoxFit.contain)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          Text('\$${product.price.toStringAsFixed(2)}'),
          ElevatedButton(
            onPressed: () => cart.addToCart(product),
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
