class HomeState {
  final List<DateTime> dateList;

  HomeState({this.dateList = const []});

  HomeState copyWith({List<DateTime>? dateList}) {
    return HomeState(dateList: dateList ?? this.dateList);
  }
}
