import 'package:events/models/datamodel.dart';
import 'package:events/services/home_service.dart';
import 'package:flutter/material.dart';

class HomeDataProvider with ChangeNotifier {
  DataModel dataModel = DataModel();
  bool isLoading = false;
  HomeServices services = HomeServices();
  DataModel get fetchedData =>dataModel;                           // to access  the fetched data outside the class
  getPostData() async {
    isLoading = true;
    dataModel = await services.getData();
    isLoading = false;
    notifyListeners();
  }
}
