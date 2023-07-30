import 'package:events/models/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventProvider with ChangeNotifier {
  List<Datum> _events = [];
  List<Datum> get events => _events;

  Future<void> fetchEvents(String query) async {
    final String apiUrl =
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=$query';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final data = DataModel.fromJson(responseData);

        if (data.content?.data != null) {
          _events = data.content!.data!;
          notifyListeners();
        }
      } else {
        print("No data Found");
      }
    } catch (error) {
      print("Error:" + error.toString());
    }
  }
}
