import 'package:flutter/material.dart';
import 'package:task_1/services/auth.dart';

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
              logOut(context);
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
    );
  }
}
