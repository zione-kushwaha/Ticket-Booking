import 'package:flutter/material.dart';
import 'package:ticket_booking/screens/admin_screen.dart';

class AdminLoginScreen extends StatelessWidget {
  static const namedRoute = '/admin_login';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateAndNavigate(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushNamed(context, admin_screen.namedRoute);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Admin Login successful"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.lightBlue,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/admin_login_background.jpg'),
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
                    'Admin Login Form',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // Admin ID Input
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Admin ID',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Admin ID';
                      }
                      return null;
                    },
                  ),

                  // Password Input
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
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
                    },
                    child: const Text('Login'),
                  ),

                  
                  const SizedBox(height: 10),
                  const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: Colors.red,
                    ),
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
