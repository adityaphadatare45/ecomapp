import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/authprovider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        home: LoginScreen(),
        routes: {
          '/products': (_) => ProductListScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
        },
      ),
    );
  }
}
