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
      backgroundColor:const Color.fromARGB(255, 82, 78, 78),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 122, 122),
        title: Text("Home", style: TextStyle(color: Colors.white),),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
           
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Recent Activity",
                  style: TextStyle(fontSize: 18,  color: Colors.white),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(), 
                shrinkWrap: true,
                itemCount: 3, 
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                      ),
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 208, 208),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("AFG-->PAK ${index + 1}"),
                            Text("DATE ${index + 1}")
                          ],
                        ),
                      ),
                      ),
                    ),
                  );
                },
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(
                  "Active Trips",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                TextButton(onPressed: (){}, child: Text("See All", style: TextStyle(color: Colors.white),))
                  ],
                ),
              ),
             ListView.builder(
                physics: NeverScrollableScrollPhysics(), 
                shrinkWrap: true,
                itemCount: 3, 
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                      ),
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 208, 208),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("AFG-->PAK ${index + 1}"),
                            Text("DATE ${index + 1}")
                          ],
                        ),
                      ),
                      ),
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
