
import 'package:flutter/cupertino.dart';

import 'AttendModel.dart';

@immutable
abstract class ViewAttendState {}

class AttendInitial extends ViewAttendState {}

class AttendLoadingState extends ViewAttendState {}

class AttendSuccessState extends ViewAttendState {
  final List<ViewAttendence> viewModels;

  AttendSuccessState({required this.viewModels});
}

class AttendErrorState extends ViewAttendState {
  final String error;

  AttendErrorState(this.error);
}

class AttendFilteredState extends ViewAttendState {
  final List<ViewAttendence> filteredstudent;

  AttendFilteredState(this.filteredstudent);
}