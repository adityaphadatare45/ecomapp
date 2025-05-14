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
                      return ListTile(
                        leading: Image.network(item.product.image, width: 50),
                        title: Text(item.product.title),
                        subtitle: Text('Quantity: ${item.quantity}'),
                        trailing: Text('\$${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
                Text("Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutScreen()));
                  },
                  child: Text("Checkout as Guest"),
                ),
              ],
            ),
    );
  }
}
