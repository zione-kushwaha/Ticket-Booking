import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/themeprovider.dart';
import '/providers/users_provider.dart';
import '/screens/admin_login_screen.dart';
import '/screens/admin_screen.dart';
import '/screens/book_ticket.dart';
import '/screens/main_screen.dart';
import '/screens/payment_screen.dart';
import '/screens/user_login_screen.dart';
import '/screens/users_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>ThemeProvider()),
      ChangeNotifierProvider(create: (_)=>users_provider())],
      child: Consumer<ThemeProvider>(builder: (context,themeprovider,child){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeprovider.currentTheme,
        home: const main_screen(),
        routes: {
          UserLoginScreen.namedRoute:(context)=>UserLoginScreen(),
          AdminLoginScreen.namedRoute:(context)=>AdminLoginScreen(),
          users_screen.namedRoute:(context)=>users_screen(),
          TicketBookingScreen.namedRoute:(context)=>TicketBookingScreen(),
          payment_screen.namedRoute:(context)=>const payment_screen(),
          admin_screen.namedRoute:(context)=> admin_screen()
        },
      );
      }),
    );
  }
}