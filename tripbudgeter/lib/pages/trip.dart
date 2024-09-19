import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trip {
  String name;
  String startDate;
  String endDate;
  String destination;
  double budget;

  Trip({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.destination,
    required this.budget,
  });
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

class NewTripForm extends StatefulWidget {
  final Function(Trip) onSubmit;

  NewTripForm({required this.onSubmit});

  @override
  _NewTripFormState createState() => _NewTripFormState();
}

class _NewTripFormState extends State<NewTripForm> {
  final _formKey = GlobalKey<FormState>();
  String _tripName = '';
  String _startDate = '';
  String _endDate = '';
  String _destination = '';
  double _budget = 0.0;

void _submitForm() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    final newTrip = Trip(
      name: _tripName,
      startDate: _startDate,
      endDate: _endDate,
      destination: _destination,
      budget: _budget,
    );

    widget.onSubmit(newTrip);

    // Show a Snackbar message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your trip is successfully created!'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16),
      ),
    );

    Navigator.of(context).pop();
  }
}

  String? _validateTripName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a trip name';
    }
    return null;
  }

  String? _validateDestination(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a destination';
    }
    return null;
  }

  String? _validateBudget(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a budget';
    }
    final double? parsedValue = double.tryParse(value);
    if (parsedValue == null || parsedValue <= 0) {
      return 'Please enter a valid budget';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Create New Trip',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Trip Name',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  _tripName = value;
                },
                validator: _validateTripName,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  _startDate = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a start date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'End Date',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  _endDate = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an end date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Destination',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  _destination = value;
                },
                validator: _validateDestination,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Budget',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _budget = double.tryParse(value) ?? 0.0;
                },
                validator: _validateBudget,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text('Create Trip', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TripManager(),
    theme: ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 253, 243, 243),
    ),
  ));
}
