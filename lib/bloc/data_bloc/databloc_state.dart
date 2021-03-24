part of 'databloc_bloc.dart';

@immutable
abstract class DatablocState {}

class DatablocInitial extends DatablocState {}

class LoadingState extends DatablocState{}

class DataFetched extends DatablocState{
  final DataModel dataModel;

  DataFetched({this.dataModel});
}


class Failed extends DatablocState{
  final String message;

  Failed({this.message});
}
