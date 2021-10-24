import 'package:dio/dio.dart';
import 'package:cometocode/src/home_page/data/source/home_page_data_source.dart';

class HomePageDataSourceImpl extends HomePageDataSource {
  final Dio _dio;

  HomePageDataSourceImpl(this._dio);

  Future exampleApi() {
    _dio.post("example..");
    return Future.value(0);
  }
}
