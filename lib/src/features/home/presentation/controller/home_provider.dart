import 'package:flutter/material.dart';
import 'package:habit_tracker/src/features/home/presentation/controller/home_state.dart';

class HomeProvider extends ChangeNotifier {
  HomeState _state = HomeState();

  HomeState get state => _state;

  HomeProvider() {
    onInit();
  }

  void onInit() {
    DateTime startDate = DateTime.now().subtract(Duration(days: 5));
    DateTime endDate = DateTime.now().add(Duration(days: 5));

    var finalDate = startDate;
    List<DateTime> dates = [];
    while (!finalDate.isAfter(endDate)) {
      dates.add(finalDate);
      finalDate = finalDate.add(Duration(days: 1));
    }
    _state = state.copyWith(dateList: dates);
    notifyListeners();
  }

  bool isCurrentDate(DateTime dt) {
    var current = DateTime.now();
    if (dt.day == current.day &&
        dt.month == current.month &&
        dt.year == current.year) {
      return true;
    }

    return false;
  }
}
