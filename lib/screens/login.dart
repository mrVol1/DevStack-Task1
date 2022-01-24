import 'package:flutter/material.dart';
import 'package:task_1/screens/register.dart';
import 'package:task_1/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginPageScreen createState() => _LoginPageScreen();
}

class _LoginPageScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final AuthServices _authServices = AuthServices();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 160.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _emailForm(),
              _passwordForm(),
              const Divider(
                height: 20.0,
                color: Colors.white,
              ),
              _loginButton(),
              const Divider(),
              _registerTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailForm() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      validator: _emailValidator,
    );
  }

  Widget _passwordForm() {
    return TextFormField(
      controller: passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      validator: _passwordValidator,
      obscureText: true,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        _authServices.signIn(
            context, emailController.text, passwordController.text);
      },
      child: const Text('Login'),
    );
  }

  Widget _registerTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No account?'),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          child: const Text('Register'),
        ),
      ],
    );
  }

  String? _emailValidator(String? value) {
    if (value!.isEmpty) {
      return ('Please Enter your Email');
    }
    if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
      return ('Please Enter a valid email');
    }
  }

  String? _passwordValidator(String? value) {
    RegExp regex = RegExp(r'^.{8,}$');
    if (value!.isEmpty) {
      return ('Password is required for login');
    }
    if (!regex.hasMatch(value)) {
      return ('Enter Valid Password(Min. 8 Character)');
    }
  }
}
