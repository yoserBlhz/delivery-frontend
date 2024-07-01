// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DeliveryShort extends StatelessWidget {
  final String location;
  final String id;

  const DeliveryShort({
    required this.location,
     required this.id,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 80,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Color(0XFFE1E1E1)),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Image.asset(
              'lib/images/going.png',
              fit: BoxFit.contain,
              width: 55,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                location,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.chevron_right_outlined),
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, '/orderDetails',arguments: {'id': id},);
              },
            ),
          ],
        ),
      ),
    );
  }
}
