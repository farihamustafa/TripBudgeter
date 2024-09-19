import 'package:flutter/material.dart';
import 'package:tripbudgeter/reusablewidgets/Card.dart';
import 'package:tripbudgeter/reusablewidgets/Drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  card(Colors.green, "Total Budget", "\$100"),
                  card(Colors.orange, "Trip Expenses", "\$200"),
                  card(const Color.fromARGB(255, 176, 243, 248), "Remaining Budget", "\$400"),
                ],
              ),
              SizedBox(height: 20,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    seccard("Planning a trip?"),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Recent Activity",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(), // Prevent scrolling
                shrinkWrap: true, // Use only the space needed
                itemCount: 3, 
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text("Activity ${index + 1}"),
                      subtitle: Text("Description of activity ${index + 1}"),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              Text(
                "Active Trips",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(), // Prevent scrolling
                shrinkWrap: true, // Use only the space needed
                itemCount: 3, 
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text("Active Trip ${index + 1}"),
                      subtitle: Text("Details of trip ${index + 1}"),
                    ),
                  );
                },
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
