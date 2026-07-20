import 'package:flutter/material.dart';
import 'package:habit_tracker/src/features/new_task/presentation/controller/new_task_state.dart';

class NewTaskProvider extends ChangeNotifier {
  NewTaskState _state = NewTaskState();
  NewTaskState get state => _state;

  NewTaskProvider() {
    initState();
  }

  void initState() {
    _state = state.copyWith(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: state.duration)),
    );

    notifyListeners();
  }

  void changeDuration(String value) {
    int duration = int.parse(value);
    _state = state.copyWith(
      duration: duration,
      endDate: state.startDate?.add(Duration(days: duration)),
    );
    notifyListeners();
  }

  void modifyStartDate(DateTime date, int duration) {
    _state = state.copyWith(
      startDate: date,
      endDate: date.add(Duration(days: duration)),
    );
    notifyListeners();
  }
}
