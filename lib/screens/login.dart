import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_1/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginPageScreen createState() => _LoginPageScreen();
}

class _LoginPageScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String? errorMessage;

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
              _loginButton(),
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
      maxLength: 8,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        _signIn(emailController.text, passwordController.text);
      },
      child: const Text('Login'),
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

  void _signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: 'Login Successful'),
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        email: email,
                        password: password,
                      ),
                    ),
                  ),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case 'invalid-email':
            errorMessage = 'Your email address appears to be malformed.';
            break;
          case 'wrong-password':
            errorMessage = 'Your password is wrong.';
            break;
          case 'user-not-found':
            errorMessage = "User with this email doesn't exist.";
            break;
          case 'user-disabled':
            errorMessage = 'User with this email has been disabled.';
            break;
          case 'too-many-requests':
            errorMessage = 'Too many requests';
            break;
          case 'operation-not-allowed':
            errorMessage = 'Signing in with Email and Password is not enabled.';
            break;
          default:
            errorMessage = 'An undefined Error happened.';
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }
}
