part of 'calendar_cubit.dart';

class CalendarState extends Equatable {
  final DateTime dateTime;
  final int index;
  final List<DayModel> days;

  const CalendarState({
    required this.dateTime,
    required this.index,
    required this.days
  });

  CalendarState copyWith({
    DateTime? dateTime,
    int? index,
    List<DayModel>? days,
  }) {
    return CalendarState(
      dateTime: dateTime ?? this.dateTime,
      index: index ?? this.index,
      days: days ?? this.days,
    );
  }

  @override
  List<Object> get props => [dateTime,index];
}
