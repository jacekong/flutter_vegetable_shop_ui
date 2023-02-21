// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:final_exam/model/vegetable.dart';

// vegetables store
class VegetableStore extends ChangeNotifier {
  List<Vegetables> _vegetable = [];
  List<Vegetables> get vegetable => _vegetable;
  void setProducts(List<Vegetables> vegetable) {
    _vegetable = vegetable;
  }

  List<Vegetables> _carts = [];
  List<Vegetables> get carts => _carts;

  Future<List<Vegetables>> fetchData({bool refresh = false}) async {
    //1. either refresh or empty list
    if (_vegetable.isEmpty || refresh == true) {
      _vegetable = [];
      //2. define url
      var url = "http://192.168.80.168:1880/vegetables";
      //3. get raw data/json text;
      var res = await get(url);
      //4. convert json text to list of dictionary
      var list1 = json.decode(res.toString()) as List;
      //5. convert map of dictionary to list of object
      List<Vegetables> vegetable = list1.map((e) => Vegetables.fromMap(e)).toList();

      setProducts(vegetable);
      //notifyListeners();
      return _vegetable;
    } else {
      return _vegetable;
    }
  } //ef

  Future<String> get(url) async {
    //1. convert param dict to json

    //2. send post request
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return res.body;
    }
    //no success
    else {
      //print(res.statusCode);
      return Future<String>.value(null);
    }
  } //ef

  void addProduct(Vegetables f) {
    // add the f to list if carts list isnt exist
    f.qty += 1;
    Vegetables? found = _carts.firstWhereOrNull((e) => e.name == f.name);
    if (found == null) {
      _carts.add(f);
    }
    notifyListeners();
  }

  void removeProduct(Vegetables f) {
    Vegetables? found =
        _carts.firstWhereOrNull((element) => element.name == f.name);
    if (found == null) {
      return;
    }
    if (f.qty > 0) {
      f.qty -= 1;
    }
    if (f.qty == 0) {
      _carts.remove(f);
    }
    notifyListeners();
  }

  int getTotalSize() {
    int total = 0;
    for (Vegetables f in _carts) {
      total += f.qty;
    }
    return total;
  }
  double getTotalPrice() {
    double total = 0;
    for (Vegetables f in _carts) {
      total += f.qty*f.price;
    }
    return total;
  }

}

