import 'package:flutter/material.dart';
import 'package:test_app_pro/model/shared_prefs_repo.dart';

class SubViewModel extends ChangeNotifier{
  SharedPrefs sharedPrefs;

  SubViewModel({required this.sharedPrefs});

  int count = 0;

  void addOne() {
    count += 1;
    notifyListeners();
  }

  void clear() {
    count = 0;
    notifyListeners();
  }
}