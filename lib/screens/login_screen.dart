import 'package:ecom_app/providers/authprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_list_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _userCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo or Icon
              Icon(
                Icons.shopping_cart_outlined,
                size: 100,
                color: Colors.blueAccent,
              ),
              SizedBox(height: 20),
              Text(
                "Welcome to EcomApp",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 30),
              // Username Field
              TextField(
                controller: _userCtrl,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Password Field
              TextField(
                controller: _passCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    if (_userCtrl.text.isNotEmpty && _passCtrl.text.isNotEmpty) {
                      auth.login(_userCtrl.text, _passCtrl.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => ProductListScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter both username and password"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10)            
            ],
          ),
        ),
      ),
    );
  }
}
