import 'package:flutter/material.dart';
import 'package:tripbudgeter/pages/BookingCard.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selected date: ${picked.toLocal()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          color: const Color.fromARGB(255, 18, 197, 220),
          onPressed: () {},
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12.0),
            const Text(
              'LETS FIND THE COOL PLACES',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: const Color.fromARGB(255, 18, 197, 220),
            onPressed: () {},
          ),
          const SizedBox(width: 8.0),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'From',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    prefixIcon: Icon(
                      Icons.my_location,
                      color: const Color.fromARGB(255, 18, 197, 220),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Where do you want to go?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 238, 185, 185),
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 18, 197, 220),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () => _selectDate(context), // Open date picker on tap
            child: BookingCard(
              title: 'TRIP START DATE',
              date: '2024-09-22',
              time: '10:00 AM',
              color: const Color.fromARGB(255, 70, 213, 235),
            ),
          ),
          GestureDetector(
            onTap: () => _selectDate(context), // Open date picker on tap
            child: BookingCard(
              title: 'TRIP END DATE',
              date: '2024-10-10',
              time: '10:00 AM',
              color: const Color.fromARGB(255, 240, 237, 141),
            ),
          ),
          // Add more BookingCard instances as needed
        ],
      ),
    );
  }
}
