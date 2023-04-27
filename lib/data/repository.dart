import 'dart:async';
import 'dart:convert';
import 'package:chefkart/data/service.dart';
import 'package:chefkart/model/dish_details.dart';
import 'package:chefkart/model/dishes_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DishesRepository {
  final DishesService _dishesService = DishesService();

  Future getDishes() async {
    try {
      http.Response response = await _dishesService.fetchDishes();

      if (response.statusCode != 200) {
        debugPrint("response code is ${response.statusCode}");
      }
      final decodedBody = jsonDecode(response.body);
      DishesList dishesList = DishesList.fromJson(decodedBody);
      return dishesList;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future getDishesDetail(int index) async {
    try {
      http.Response response = await _dishesService.fetchDishesDetails(index);

      if (response.statusCode != 200) {
        debugPrint("response code is ${response.statusCode}");
      }
      final decodedBody = jsonDecode(response.body);
      DishDetails dishDetails = DishDetails.fromJson(decodedBody);
      return dishDetails;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
