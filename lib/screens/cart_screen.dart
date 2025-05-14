import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: cartItems.isEmpty
          ? Center(child: Text("Cart is Empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (ctx, i) {
                      var item = cartItems.values.toList()[i];
                      return Column(
                        children: [
                          ListTile(
                            leading: Image.network(
                              item.product.image,
                              width: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error, size: 50);
                              },
                            ),
                            title: Text(item.product.title),
                            subtitle: Text('Quantity: ${item.quantity}'),
                            trailing: Text(
                                '\$${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                          ),
                          Divider(), // Add divider between items
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CheckoutScreen()),
                          );
                        },
                        child: Text("Checkout as Guest"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
