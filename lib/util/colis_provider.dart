import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:delivery_app/models/ColisModel.dart';

class ColisProvider with ChangeNotifier {
  List<ColisModel> _colisList = [];

  List<ColisModel> get colisList => _colisList;

  /*Future<void> fetchColis() async {
    final response = await http.get(
      Uri.parse('https://delivery-4yv5.onrender.com/facture'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      _colisList = data.map((item) => ColisModel.fromJson(item)).toList();
      notifyListeners();
    } else {
      print('Failed to load colis');
    }
  }*/
  Future<void> fetchColis(String email) async {
    final response = await http.get(
      //Uri.parse('https://delivery-4yv5.onrender.com/facture?email=$email'),
      Uri.parse('https://delivery-4yv5.onrender.com/facturenew/transporteur/email/$email'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      _colisList = data.map((item) => ColisModel.fromJson(item)).toList();
      notifyListeners();
    } else {
      print('Failed to load colis');
    }
  }

  void addColis(ColisModel colis) {
    _colisList.add(colis);
    notifyListeners();
  }

   List<ColisModel> getPickedUpColis() {
    return _colisList.where((colis) => colis.status == "PickedUp").toList();
  }
}
