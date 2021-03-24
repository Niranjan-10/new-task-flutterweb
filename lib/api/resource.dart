import 'package:aspod/models/data_model.dart';
import 'package:dio/dio.dart';

class Resource{
  String  baseUrl = "https://api.nasa.gov/planetary/apod?api_key=aWPhODExHc5j48m59viPzCysv1jkoaN7ID2dchPw&date=";
  Dio dio = Dio();
  Future<DataModel> getData(String data)async{
    try{
      var response = await dio.get(baseUrl+data);

      if(response.statusCode == 200){
        return DataModel.fromJson(response.data);
      }


    }catch(e){
      throw Exception(e);
    }
  }


}