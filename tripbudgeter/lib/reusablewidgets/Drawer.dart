import 'package:flutter/material.dart';

Widget MyDrawer(){
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color.fromARGB(255, 218, 220, 221), const Color.fromARGB(255, 76, 76, 77)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
             
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black
                       ),
                  ),
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.luggage),
                    title: Text("Completed trips"),
                   
                  ),
                  ListTile(
                    leading: Icon(Icons.report),
                    title: Text("Reports"),
                    
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("About us"),
                    
                  ),
                  ListTile(
                    leading: Icon(Icons.image),
                    title: Text("Image gallery"),
                    
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_emergency),
                    title: Text("Contact us"),
                    
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
