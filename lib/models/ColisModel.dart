// ignore_for_file: file_names

class ColisModel {
  final String id;
 // final String creationDate;
  final String description;
  final String location;
  final String amount;
  final String clientName;
  final String clientPhone;
  final String status;
  final String livreur;


  ColisModel({
    required this.id,
    //required this.creationDate,
    required this.description,
    required this.location,
    required this.amount,
    required this.clientName,
    required this.clientPhone,
    required this.status,
    required this.livreur,

  });

  factory ColisModel.fromJson(Map<String, dynamic> json) {
    return ColisModel(
      id: json['_id'],
      //creationDate: json['creationDate'],
      description: json['description'],
      location: json['location'],
      amount: json['amount'].toString(),
      clientName: json['clientName'],
      clientPhone: json['clientPhone'],
      status: json['status'],
      livreur: json['livreur'],

    );
  }
}
