import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking/models/Users.dart';
import 'package:ticket_booking/providers/users_provider.dart';



class TripBookingScreen extends StatefulWidget {
  @override
  _TripBookingScreenState createState() => _TripBookingScreenState();
}

class _TripBookingScreenState extends State<TripBookingScreen> {
  List<TripMember> tripMembers = [];

  @override
  Widget build(BuildContext context) {
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            _addTripMember();
          },
          child: const Text('Add Trip Member'),
        ),
        const SizedBox(height: 20),
        for (int i = 0; i < tripMembers.length; i++)
          _buildTripMemberInput(i + 1),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_validateFields()) {
              _handleGroupTripBooking();
              Provider.of<users_provider>(context,listen: false).addListRecord(tripMembers);
            } else {
              _showErrorDialog(message: 'Please! Fill all the field');
            }
          },
          child: const Text('Add item to Cart'),
        ),
      ],
    );
  }

  Widget _buildTripMemberInput(int memberNumber) {
    TripMember tripMember = tripMembers[memberNumber - 1];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Trip Member #$memberNumber:'),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                _removeTripMember(memberNumber - 1);
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: (value) {
            tripMember.name = value;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Name',
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: (value) {
            tripMember.mobileNumber = value;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            
            hintText: 'Enter Mobile Number',
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: (value) {
            tripMember.location = value;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Location',
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _addTripMember() {
    setState(() {
      tripMembers.add(TripMember());
    });
  }

  void _removeTripMember(int index) {
    setState(() {
      tripMembers.removeAt(index);
    });
  }

  bool _validateFields() {
    for (int i = 0; i < tripMembers.length; i++) {
      TripMember tripMember = tripMembers[i];
      if (tripMember.name.isEmpty ||
          tripMember.mobileNumber.isEmpty ||
          tripMember.location.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void _handleGroupTripBooking() {
    if (tripMembers.isEmpty) {
      _showErrorDialog(message: 'Add at least one trip member to book the trip.');
    } else {
    _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Group trip booked successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog({required String message}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
