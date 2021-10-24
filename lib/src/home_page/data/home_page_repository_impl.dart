import 'package:cometocode/src/home_page/data/source/home_page_data_source.dart';
import 'package:cometocode/src/home_page/domain/home_page_repository.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  final HomePageDataSource _homePageRemoteDataSource;

  HomePageRepositoryImpl(this._homePageRemoteDataSource);

  Future exampleApi() => _homePageRemoteDataSource.exampleApi();
}
