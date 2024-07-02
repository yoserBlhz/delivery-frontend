// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:delivery_app/pages/PickedUpPage_page.dart';
import 'package:delivery_app/pages/allDeliveries_page.dart';
import 'package:delivery_app/pages/completedDeliveries_page.dart';
import 'package:delivery_app/pages/failedDeliveries_page.dart';
import 'package:delivery_app/pages/home_page.dart';
import 'package:delivery_app/pages/login_page.dart';
import 'package:delivery_app/pages/orderDetails.dart';
import 'package:flutter/material.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF202E5C)),
      ),
      routes: {
        '/homePage': (context) => HomePage(),
        '/loginPage': (context) => LoginPage(),
        '/allDeliveries': (context) => AllDeliveriesPage(),
        '/failedDeliveries': (context) => FailedDeliveriesPage(),
        '/pickedUpDeliveries': (context) => PickedUpDeliveriesPage(),
        '/completedDeliveries': (context) => CompletedDeliveriesPage(),
  '/orderDetails': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    return OrderDetailsPage(id: args['id']);
  },      },
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
