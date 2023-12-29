import 'package:flutter/material.dart';
import 'package:ticket_booking/screens/users_screen.dart';

class UserLoginScreen extends StatelessWidget {
  static const namedRoute = '/user_login';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   void _validateAndNavigate(BuildContext context) {
    
    if (_formKey.currentState?.validate() ?? false) {
      
      Navigator.pushNamed(context, users_screen.namedRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/user_login_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  const Text(
                    'User Login Form',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // Email Input
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),

                  // Password Input
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  // Login Button
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _validateAndNavigate(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Login successful"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.lightBlue,
    ));
                    },
                    child: const Text('Login'),
                  ),

                  // Create Account Section
                  const SizedBox(height: 20),
                  const Text(
                    'Don\'t have an account? Create one now!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      //logic to create new account but i have ignored this one
                    },
                    child: const Text('Create Account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
