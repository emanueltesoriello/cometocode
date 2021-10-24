import 'package:dio/dio.dart';
import 'package:cometocode/src/start/data/source/start_page_data_source.dart';

class StartPageDataSourceImpl extends StartPageDataSource {
  final Dio _dio;

  StartPageDataSourceImpl(this._dio);

  Future getApiExample() {
    /*
    try {
      //Call _dio.get ... 
    } catch (e) {
    }*/
    return Future.value(0);
  }
}
