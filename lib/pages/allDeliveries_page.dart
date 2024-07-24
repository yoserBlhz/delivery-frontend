// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:delivery_app/util/delivery_short.dart';
import 'package:provider/provider.dart';
import '../util/EmailProvider.dart';
import '../util/colis_provider.dart';

class AllDeliveriesPage extends StatefulWidget {
  const AllDeliveriesPage({Key? key}) : super(key: key);

  @override
  _AllDeliveriesPageState createState() => _AllDeliveriesPageState();
}

class _AllDeliveriesPageState extends State<AllDeliveriesPage> {
  late Future<void> _fetchColisFuture; // Future for fetching colis

  @override
  void initState() {
    super.initState();
    final emailProvider = Provider.of<EmailProvider>(context, listen: false);
    final colisProvider = Provider.of<ColisProvider>(context, listen: false);
    _fetchColisFuture = colisProvider.fetchColis(emailProvider.email);
  }

  @override
  Widget build(BuildContext context) {
    final emailProvider = Provider.of<EmailProvider>(context);
    final colisProvider = Provider.of<ColisProvider>(context);

    return Scaffold(
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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFF202E5C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Explore All Your Deliveries',
                        style: TextStyle(
                          color: Color(0xFF202E5C),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    FutureBuilder(
                      future: _fetchColisFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: colisProvider.colisList.length,
                            itemBuilder: (context, index) {
                              return DeliveryShort(
                                location: colisProvider.colisList[index].location,
                                id: colisProvider.colisList[index].id,
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
