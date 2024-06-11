import 'package:easy_transport_driver/cubits/auth/cubit.dart';
import 'package:easy_transport_driver/screens/login_ui_actions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // Controllers to retrieve text field input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context, true);
    return Scaffold(
      appBar: AppBar(
        leading:
            GestureDetector(onTap: () {}, child: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Login',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Easy Transport Driver',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Username field
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'User Name',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 16.0),

                  // Password field
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true, // Use for password fields
                  ),
                  const SizedBox(height: 24.0),

                  // Login button
                  ElevatedButton(
                    onPressed: () async {
                      final map = {
                        "userName": _emailController.text,
                        "password": _passwordController.text
                      };
                      authCubit.logIn(map);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue[900],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
              const LoginUIActions(),
            ],
          ),
        ),
      ),
    );
  }
}
