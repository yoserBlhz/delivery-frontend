// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

/*import 'package:flutter/material.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              'lib/images/deliveryCard.jpg',
              fit: BoxFit.cover,
              width: 320,
              height: 170,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFF4648EE),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Simon Sion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        
                           Icon(
                            Icons.location_on,
                            color: Color(0xFFADADAD),
                            size: 16,
                          ),
                          
                        
                        SizedBox(width: 4),
                        Text(
                          "La Jarre,Nabeul",
                          style: TextStyle(
                            color: Color(0xFFADADAD),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
    home: Scaffold(
      appBar: AppBar(
        title: Text('Delivery Card Example'),
      ),
      body: Center(
        child: DeliveryCard(),
      ),
    ),
  ));
}
*/
import 'package:flutter/material.dart';

class DeliveryCard extends StatelessWidget {
  final String clientName;
  final String location;

  DeliveryCard({
    required this.clientName,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,      child: Stack(
        children: [
ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              'lib/images/deliveryCard.jpg',
              fit: BoxFit.cover,
              width: 320,
              height: 170,
            ),
          ),          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFF4648EE),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      clientName, // Utilisation du nom du client dynamique
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xFFADADAD),
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          location, // Utilisation de la localisation dynamique
                          style: TextStyle(
                            color: Color(0xFFADADAD),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
