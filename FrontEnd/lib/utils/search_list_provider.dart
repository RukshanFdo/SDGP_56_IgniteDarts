import 'package:flutter/cupertino.dart';

class SearchListProvider with ChangeNotifier {
  List<String> _ingreentList = ["", "", "", "", ""];
  String _time = '>10';
  List<String> get ingredientList => _ingreentList;
  String get time => _time;

  void addToList(String _item, int _index) {
    _ingreentList[_index] = _item;
    notifyListeners();
  }

  void changeDuration(String duration) {
    _time = duration;
    notifyListeners();
  }
}
