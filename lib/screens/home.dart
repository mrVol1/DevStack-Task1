import 'package:flutter/material.dart';
import 'package:task_1/screens/login.dart';
import 'package:task_1/screens/register.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  final String password;
  const HomeScreen({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter login demo'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              _logOut(context);
            },
            child: const Text(
              'LogOut',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Center(
            child: Text(
              'Welcome',
              style: TextStyle(fontSize: 32.0),
            ),
          ),
          const SizedBox(
            height: 86.0,
          ),
          Text('email: $email'),
          Text('password: $password'),
        ],
      ),
      floatingActionButton: _registerButton(context),
    );
  }

  void _logOut(BuildContext context) {
    Route route = MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    );
    Navigator.push(context, route);
  }

  Widget _registerButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Route route = MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
        Navigator.push(context, route);
      },
      child: const Icon(Icons.add),
    );
  }
}
