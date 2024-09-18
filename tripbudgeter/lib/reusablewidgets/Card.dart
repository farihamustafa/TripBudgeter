import 'package:flutter/material.dart';

Widget card(Color boxcolor,String maintext, String text){
  return  Card(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                    color: boxcolor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    height: 150,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text(maintext, style: TextStyle(color: Colors.white, fontSize: 25))),
                        ),
                        Center(child: Text(text, style: TextStyle(color: Colors.black, fontSize: 20))),
                      ],
                    ),
                  ),
                );
}
Widget seccard(String text){
  return Card(
  child: Container(
    height: 130,
    width: 220,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 27),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 10), 
          TextButton(
            onPressed: () {},
            child: Text(
              "Add",
              style: TextStyle(color: Colors.black),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
}