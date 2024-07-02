// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderDetailsPage extends StatefulWidget {
  final String id;

  const OrderDetailsPage({required this.id, Key? key}) : super(key: key);

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late Map<String, dynamic> colisDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchColisDetails();
  }


Future<void> updateDeliveryStatus(String status) async {
  // Envoyer la requête HTTP pour mettre à jour le statut de la livraison
  final response = await http.patch(
    Uri.parse('https://delivery-4yv5.onrender.com/colis/${widget.id}/status'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'status': status,
    }),
  );

  if (response.statusCode == 200) {
    // Succès : Mettre à jour l'affichage ou effectuer d'autres actions nécessaires
    setState(() {
      colisDetails['status'] = status;
    });
  } else {
    // Gérer les erreurs
    print('Failed to update delivery status');
  }
}




  Future<void> fetchColisDetails() async {
    final response = await http.get(Uri.parse('https://delivery-4yv5.onrender.com/colis/${widget.id}'));

    if (response.statusCode == 200) {
      setState(() {
        colisDetails = json.decode(response.body);
        isLoading = false;
      });
    } else {
      // Handle error
      throw Exception('Failed to load colis details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/map.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
                    onPressed: () {
                      Navigator.pushNamed(context, '/allDeliveries');
                    },
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  bottom: 80,
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
                          Row(
                            children: [
                              Image.asset(
                                'lib/images/details.png',
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Your Order Details',
                                  style: TextStyle(
                                    color: Color(0xFF202E5C),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          buildDetailsRow('Order Id', colisDetails['_id']),
                          buildDetailsRow('Description', colisDetails['description']),
                          buildDetailsRow('Location', colisDetails['location']),
                          buildDetailsRow('Amount', colisDetails['amount'].toString()),
                          buildDetailsRow('Status', colisDetails['status']),

                          SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset(
                                'lib/images/clientDetails.png',
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Client Details',
                                  style: TextStyle(
                                    color: Color(0xFF202E5C),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          buildDetailsRow('Full Name', colisDetails['clientName']),
                          buildDetailsRow('Phone Number', colisDetails['clientPhone']),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF202E5C),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Delivery Status',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildStatusButton('PickedUp', 'lib/images/pickedup.png'),
                            buildStatusButton('Completed', 'lib/images/completed.png'),
                            buildStatusButton('Failed', 'lib/images/failedStatus.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildDetailsRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF202E5C),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Color(0xFFADADAD),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /*Widget buildStatusButton(String text, String imagePath) {
      return Column(
      children: [
        Image.asset(
          imagePath,
          height: 50,
          width: 50,
        ),
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }*/


Widget buildStatusButton(String text, String imagePath) {
  return GestureDetector(
    onTap: () {
      updateDeliveryStatus(text); // Appel à une méthode pour mettre à jour le statut
    },
    child: Column(
      children: [
        Image.asset(
          imagePath,
          height: 50,
          width: 50,
        ),
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}


}
