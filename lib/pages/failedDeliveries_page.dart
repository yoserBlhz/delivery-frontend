// ignore_for_file: file_names, prefer_const_constructors

/*import 'package:flutter/material.dart';
import 'package:delivery_app/util/delivery_short.dart';

class FailedDeliveriesPage extends StatelessWidget {
  const FailedDeliveriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          }),
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
                        'Explore Your Failed Deliveries',
                        style: TextStyle(
                          color: Color(0xFF202E5C),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        DeliveryShort(),
                        SizedBox(height: 16),
                        DeliveryShort(),
                        SizedBox(height: 16),
                        DeliveryShort(),
                      ],
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

void main() {
  runApp(MaterialApp(
    home: FailedDeliveriesPage(),
  ));
}
*/
import 'package:flutter/material.dart';
import 'package:delivery_app/util/delivery_short.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:delivery_app/models/ColisModel.dart'; 

class FailedDeliveriesPage extends StatefulWidget {
  const FailedDeliveriesPage({Key? key}) : super(key: key);

  @override
  _FailedDeliveriesPageState createState() => _FailedDeliveriesPageState();
}

class _FailedDeliveriesPageState extends State<FailedDeliveriesPage> {
  List<ColisModel> colisList = []; 

  @override
  void initState() {
    super.initState();
    fetchColis(); 
  }

  Future<void> fetchColis() async {
    final response = await http.get(
      Uri.parse('https://delivery-4yv5.onrender.com/colis'), 
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        colisList = data.map((item) => ColisModel.fromJson(item)).toList();
      });
    } else {
      print('Failed to load colis');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        'Explore Your Failed Deliveries',
                        style: TextStyle(
                          color: Color(0xFF202E5C),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: colisList.length,
                      itemBuilder: (context, index) {
                        return DeliveryShort(
                          location: colisList[index].location,
                          id: colisList[index].id,
                        );
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

void main() {
  runApp(MaterialApp(
    home: FailedDeliveriesPage(),
  ));
}
