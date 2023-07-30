import 'package:events/models/datamodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeServices{
  Future<DataModel> getData() async{
    DataModel dataModel = DataModel();
    try {
      final response = await http.get(
        Uri.parse('https://sde-007.api.assignment.theinternetfolks.works/v1/event'),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body); 
        dataModel = DataModel.fromJson(item);                                     // Mapping json response to our datum
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred'+e.toString());
    }
    return dataModel;
    
  }
}