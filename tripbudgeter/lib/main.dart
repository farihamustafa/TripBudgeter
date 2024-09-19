import 'package:flutter/material.dart';
import 'package:tripbudgeter/pages/bookingpage.dart';
import 'package:tripbudgeter/pages/loginpage.dart';
import 'package:tripbudgeter/pages/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUDGET APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: TripManager(), // Update this to TripManager or wherever your entry point is
    );
  }
}

class TripManager extends StatefulWidget {
  @override
  _TripManagerState createState() => _TripManagerState();
}

class _TripManagerState extends State<TripManager> {
  final List<Trip> _activeTrips = [];
  final List<Trip> _completedTrips = [];

  void _addTrip(Trip trip) {
    setState(() {
      _activeTrips.add(trip);
    });
  }

  void _completeTrip(Trip trip) {
    setState(() {
      _activeTrips.remove(trip);
      _completedTrips.add(trip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Trip Manager',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildTripSection('Active Trips', _activeTrips, _completeTrip),
                _buildTripSection('Completed Trips', _completedTrips, null),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NewTripForm(onSubmit: _addTrip),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: Text('Add New Trip', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildTripSection(String title, List<Trip> trips, Function? onComplete) {
    return ExpansionTile(
      title: Text(title),
      children: trips.map((trip) {
        return ListTile(
          title: Text(trip.name),
          subtitle: Text('${trip.startDate} - ${trip.endDate}'),
          trailing: onComplete != null
              ? ElevatedButton(
                  onPressed: () => onComplete(trip),
                  child: Text('Complete'),
                )
              : null,
        );
      }).toList(),
    );
  }
}
