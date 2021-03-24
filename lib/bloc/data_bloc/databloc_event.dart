part of 'databloc_bloc.dart';

@immutable
abstract class DatablocEvent {}


class DataSubmitEvent extends DatablocEvent{
  final String date;

  DataSubmitEvent({this.date});

}