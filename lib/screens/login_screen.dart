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
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _userCtrl, decoration: InputDecoration(labelText: "Username")),
            TextField(controller: _passCtrl, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                auth.login(_userCtrl.text, _passCtrl.text);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ProductListScreen()),
                );
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
