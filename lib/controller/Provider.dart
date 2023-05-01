import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/Model.dart';

// ignore: constant_identifier_names
enum Providerstatus { LOADING, COMPLETED }

class DataProvider extends ChangeNotifier {
  List<User> datas = [];
  Providerstatus status = Providerstatus.LOADING;

  fetchData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    (response.toString());
    if (response.statusCode == 200) {
      datas = userFromJson(response.body);
      status = Providerstatus.COMPLETED;
    } else {
      throw Exception('Failed to load album');
    }
    notifyListeners();
  }
}
