// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking/providers/themeprovider.dart';
import 'package:ticket_booking/screens/book_ticket.dart';
import 'package:ticket_booking/screens/payment_screen.dart';

class users_screen extends StatelessWidget {
  static const namedRoute = '/users_screen';
  void _showNotification(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('You have a new notification!'),
        action: SnackBarAction(
          label: 'View',
          onPressed: () {},
        ),
      ),
    );
  }

  List<Container> imagelist = [
    for (int i = 1; i < 8; i++)
      Container(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('lib/assets/images$i.jpg', fit: BoxFit.cover),
        ),
      ),
  ];

  users_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    var color = !provider.currenttheme()
        ? const Color.fromARGB(255, 250, 104, 93)
        : Colors.white;
    return Scaffold(
      backgroundColor: !provider.currenttheme()
          ? const Color.fromARGB(255, 250, 104, 93)
          : const Color.fromARGB(255, 153, 149, 149),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              card(provider, color, context),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: !provider.currenttheme()
                      ? Colors.white
                      : const Color.fromARGB(255, 92, 90, 90),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      items: imagelist,
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Text(
                      'Welcome to the Traveling App!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Explore new destinations, plan your trips, and enjoy your travels!',
                      style: TextStyle(
                          fontSize: 16,
                          color: provider.currenttheme()
                              ? Colors.white
                              : Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    
                 GestureDetector(
                   onTap: (){ 
                      Navigator.pushNamed(context, payment_screen.namedRoute);
                   },
                   child: Container(
                                 padding: const EdgeInsets.all(16),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   color: Colors.blue,
                                 ),
                                 child: const Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                    Text(
                      'Card Holder',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Card Number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '**** **** **** 1234',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expiry Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '12/24',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CVV',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '***',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                                   ],
                                 ),
                               ),
                 )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: color,
        onPressed: () {
          Navigator.pushNamed(context, TicketBookingScreen.namedRoute);
        },
        label: Text(
          'Add Item to Cart',
          style: TextStyle(
              color: provider.currenttheme() ? Colors.black : Colors.white),
        ),
      ),
    );
  }

  Container card(ThemeProvider provider, Color color, BuildContext context) {
    return Container(
              height: 70,
              color: provider.currenttheme()
                  ? const Color.fromARGB(255, 96, 94, 94)
                  : Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.home, color: color),
                      ),
                      Text(
                        'Explore world',
                        style: TextStyle(fontSize: 20, color: color),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              provider.toggleTheme();
                            },
                            icon: Icon(
                              !Provider.of<ThemeProvider>(context)
                                  .currenttheme()
                              ? Icons.light_mode
                              : Icons.dark_mode,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.notifications, color: color),
                            onPressed: () {
                              _showNotification(context);
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
  }
}
