import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking/providers/themeprovider.dart';
import 'package:ticket_booking/widget/individual_user.dart';

class TicketBookingScreen extends StatefulWidget {
  static const namedRoute = '/ticketbook';

  @override
  _TicketBookingScreenState createState() => _TicketBookingScreenState();
}



class _TicketBookingScreenState extends State<TicketBookingScreen> {
  DateTime selectedDate = DateTime.now();
  int numberOfTickets = 1;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Booking'),
        backgroundColor: !provider.currenttheme()
            ? Colors.red
            : const Color.fromARGB(255, 49, 48, 48),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Text('Date of Travel: '),
                  Text(
                    '${selectedDate.toLocal()}'.split(' ')[0],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Select Date'),
              ),
              const SizedBox(height: 20),
               TripBookingScreen()
            ],
          ),
        ),
      ),
    );
  }

 
}
