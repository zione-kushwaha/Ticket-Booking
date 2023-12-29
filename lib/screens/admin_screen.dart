// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking/providers/users_provider.dart';

class admin_screen extends StatelessWidget {
  static const namedRoute = '/admin_screen';

  // Assuming you have a list of records
  List<Map<String, String>> records = [
    {'name': 'John Doe', 'contact': '+1 (123) 456-7890', 'location': 'Office A'},
    {'name': 'Jane Smith', 'contact': '+1 (456) 789-0123', 'location': 'Office B'},
    // Add more records as needed
  ];

  admin_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<users_provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Screen'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            // Display the list of records
            ListView.builder(
              shrinkWrap: true,
              itemCount: provider.user.length,
              itemBuilder: (context, index) {
                return RecordCard(
                  name: provider.user[index].name,
                  contact: provider.user[index].mobileNumber,
                  location: provider.user[index].location,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RecordCard extends StatelessWidget {
  final String name;
  final String contact;
  final String location;

  RecordCard({required this.name, required this.contact, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text('Name: $name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact: $contact'),
            Text('Location: $location'),
            const Row(children: [Icon(Icons.check_box,color: Colors.green,),
            Text(' Ticket Booked!')],)
          ],
        ),
      ),
    );
  }
}
