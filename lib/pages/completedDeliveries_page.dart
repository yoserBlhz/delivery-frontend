// ignore_for_file: file_names, prefer_const_constructors

/*import 'package:flutter/material.dart';
import 'package:delivery_app/util/delivery_short.dart';

class CompletedDeliveriesPage extends StatelessWidget {
  const CompletedDeliveriesPage({Key? key}) : super(key: key);

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
                        'Completed Deliveries',
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
*/
/*void main() {
  runApp(MaterialApp(
    home: CompletedDeliveriesPage(),
  ));
}
*/

import 'package:flutter/material.dart';
import 'package:delivery_app/util/delivery_short.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:delivery_app/models/ColisModel.dart'; // Importez votre modèle de colis ici

class CompletedDeliveriesPage extends StatefulWidget {
  const CompletedDeliveriesPage({Key? key}) : super(key: key);

  @override
  _CompletedDeliveriesPageState createState() => _CompletedDeliveriesPageState();
}

class _CompletedDeliveriesPageState extends State<CompletedDeliveriesPage> {
  List<ColisModel> colisList = []; // Liste pour stocker les colis
  List<ColisModel> completedColisList = []; //Liste our completed deliveries

  @override
  void initState() {
    super.initState();
    fetchColis(); // Appel à la méthode pour récupérer les colis au chargement de la page
  }

  Future<void> fetchColis() async {
    final response = await http.get(
      Uri.parse('https://delivery-4yv5.onrender.com/colis'), // Remplacez par votre endpoint correct
    );

   /* if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        colisList = data.map((item) => ColisModel.fromJson(item)).toList();
      });
    } else {
      print('Failed to load colis');
    }
  }*/
     if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ColisModel> allColis = data.map((item) => ColisModel.fromJson(item)).toList();

      setState(() {
        colisList = allColis; // Mettre à jour colisList avec tous les colis
        completedColisList = allColis.where((colis) => colis.status == "Completed").toList();
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
                        'Explore Your Completed Deliveries',
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
                      itemCount: completedColisList.length,
                      itemBuilder: (context, index) {
                        return DeliveryShort(
                          location: completedColisList[index].location,
                          id: completedColisList[index].id,
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
    home: CompletedDeliveriesPage(),
  ));
}
