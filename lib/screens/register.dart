import 'package:flutter/material.dart';
import 'package:task_1/screens/login.dart';
import 'package:task_1/services/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
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
              _registerButton(),
              const Divider(),
              _loginTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('have an account?'),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  Widget _emailForm() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      validator: _emailValidator,
      controller: emailController,
    );
  }

  Widget _passwordForm() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      validator: _passwordValidator,
      controller: passwordController,
      obscureText: true,
    );
  }

  Widget _registerButton() {
    return ElevatedButton(
      onPressed: () {
        _authServices.signUp(
            context, emailController.text, passwordController.text);
      },
      child: const Text('Register'),
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
