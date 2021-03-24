
import 'package:aspod/api/resource.dart';
import 'package:aspod/models/data_model.dart';
import 'package:aspod/services/locator.dart';

class Repository{
  Resource resource = locator<Resource>();
  Future<DataModel> getData(date) => resource.getData(date);
}