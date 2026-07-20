class NewTaskState {
  final DateTime? startDate;
  final DateTime? endDate;
  final int duration;

  NewTaskState({this.startDate, this.endDate, this.duration = 5});

  NewTaskState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    int? duration,
  }) {
    return NewTaskState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
