import 'dart:async';

import 'package:aspod/models/data_model.dart';
import 'package:aspod/repositories/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'databloc_event.dart';
part 'databloc_state.dart';

class DatablocBloc extends Bloc<DatablocEvent, DatablocState> {
  DatablocBloc(this._repository) : super(DatablocInitial());

 Repository _repository;

  

  @override
  Stream<DatablocState> mapEventToState(
    DatablocEvent event,
  ) async* {
    if(event is DataSubmitEvent){
      yield* mapEventToDataFetchingState(event.date);
    }
  }
  Stream<DatablocState> mapEventToDataFetchingState(String date) async*{
    try{
      yield LoadingState();
     DataModel data = await _repository.getData(date);
     yield DataFetched(dataModel: data);

    }catch(e){
      yield Failed(message:"Sorry can not load");
    }
  }


}
