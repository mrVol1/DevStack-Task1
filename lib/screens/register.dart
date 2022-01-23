import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_1/screens/home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _register = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
        ),
      ),
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
    );
  }

  Widget _registerButton() {
    return ElevatedButton(
      onPressed: () {
        _signUp(emailController.text, passwordController.text);
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

  void _signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _register
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: 'Register Successful'),
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        email: email,
                        password: password,
                      ),
                    ),
                  ),
                });
      } on FirebaseAuthException catch (_) {
        return null;
      }
    }
  }
}
