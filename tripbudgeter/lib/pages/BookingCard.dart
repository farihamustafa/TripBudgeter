// BookingCard.dart
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final Color color;

  const BookingCard({
    Key? key,
    required this.title,
    required this.date,
    required this.time,
    this.color = Colors.white, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Margin around the card
      child: Card(
        color: color,
        elevation: 4, // Shadow effect
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Increase padding for larger card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20, // Larger font size for title
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                date,
                style: TextStyle(fontSize: 16), // Larger font size for date
              ),
              const SizedBox(height: 4.0),
              Text(
                time,
                style: TextStyle(fontSize: 16), // Larger font size for time
              ),
            ],
          ),
        ),
      ),
    );
  }
}
