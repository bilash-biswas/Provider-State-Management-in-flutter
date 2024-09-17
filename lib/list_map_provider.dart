
import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier{
  final List<Map<String, dynamic>> _list = [];

  void addData(Map<String, dynamic> data){
    _list.add(data);
    notifyListeners();
  }

  void updateData(Map<String, dynamic> data, int index){
    _list[index] = data;
    notifyListeners();
  }

  void deleteData(int index){
    _list.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> getData() => _list;

}