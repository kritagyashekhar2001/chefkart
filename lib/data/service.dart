import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DishesService {
  Future fetchDishes() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/"),
      );
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future fetchDishesDetails(int index) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/$index"),
      );
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
