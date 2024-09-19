import 'package:flutter/material.dart';

Widget card(Color boxcolor,String maintext, String text){
  return  Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: boxcolor,
                    ),
                   height: 140,
                   width: 140,
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
    height: 125,
    width: 460,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 160),
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                         
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Add Now",
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
}