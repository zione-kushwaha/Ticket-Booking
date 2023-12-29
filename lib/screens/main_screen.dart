import 'package:flutter/material.dart';
import 'package:ticket_booking/screens/admin_login_screen.dart';
import 'package:ticket_booking/screens/user_login_screen.dart';

class main_screen extends StatelessWidget {
  const main_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AdminLoginScreen.namedRoute);
                },
                child: const Text('Admin Login'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                 Navigator.pushNamed(context, UserLoginScreen.namedRoute);
                },
                child: const Text('User Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}