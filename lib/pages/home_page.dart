// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable
import 'package:flutter/material.dart';
import 'package:delivery_app/models/ColisModel.dart';
import 'package:delivery_app/util/delivery_card.dart';
import 'package:provider/provider.dart';

import '../util/EmailProvider.dart';
import '../util/colis_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Utilisez l'email pour filtrer les factures pour l'utilisateur
    final emailProvider = Provider.of<EmailProvider>(context, listen: false);
    final colisProvider = Provider.of<ColisProvider>(context, listen: false);
    colisProvider.fetchColis(emailProvider.email); // Passez l'email ici
  }

  @override
  Widget build(BuildContext context) {
    final emailProvider = Provider.of<EmailProvider>(context);
    final colisProvider = Provider.of<ColisProvider>(context);
    List<ColisModel> enStockColisList = colisProvider.colisList.where((colis) => colis.status == "enStock").toList();

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/images/retour.png',
                width: 30,
                height: 30,
              ),
              label: "Returned",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/images/ongoing.png',
                width: 30,
                height: 30,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/images/logOut.png',
                width: 30,
                height: 30,
              ),
              label: "LogOut",
            ),
          ],
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, '/failedDeliveries');
                break;
              case 1:
                Navigator.pushReplacementNamed(context, '/homePage');
                break;
              case 2:
                Navigator.pushReplacementNamed(context, '/loginPage');
                break;
            }
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Color(0xFF202E5C),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 33,
                    left: 24,
                    right: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your deliveries for today',
                          style: TextStyle(
                            color: Color(0XFF91B3FA),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/allDeliveries');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'See more',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        itemCount: enStockColisList.length,
                        itemBuilder: (context, index) {
                          return DeliveryCard(
                            clientName: enStockColisList[index].clientName,
                            location: enStockColisList[index].location,
                            id: enStockColisList[index].id,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'Delivery Status',
                  style: TextStyle(
                    color: Color(0xFF202E5C),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStatusButton(context, 'PickedUp', 'lib/images/pickedup.png', '/pickedUpDeliveries'),
                  buildStatusButton(context, 'Completed', 'lib/images/completed.png', '/completedDeliveries'),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'Orders',
                  style: TextStyle(
                    color: Color(0xFF202E5C),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "lib/images/thisWeek.jpg",
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color(0XFFD7E4F7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Today',
                                      style: TextStyle(
                                        color: Color(0xFF1F71BA),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '20',
                                      style: TextStyle(
                                        color: Color(0xFF8DB7FF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "lib/images/Today.jpg",
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color(0XFFD7E4F7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'This Week',
                                      style: TextStyle(
                                        color: Color(0xFF1F71BA),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '120',
                                      style: TextStyle(
                                        color: Color(0xFF8DB7FF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildStatusButton(BuildContext context, String text, String imagePath, String routeName) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacementNamed(context, routeName);
    },
    child: Column(
      children: [
        Image.asset(
          imagePath,
          height: 35,
          width: 50,
        ),
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
/*void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EmailProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}*/