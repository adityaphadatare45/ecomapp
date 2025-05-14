import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Thank you for your purchase!", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Total Paid: \$${cart.totalPrice.toStringAsFixed(2)}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cart.clearCart();
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("Go Back to Home"),
            )
          ],
        ),
      ),
    );
  }
}
