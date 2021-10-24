import 'package:cometocode/src/start/data/source/start_page_data_source.dart';
import 'package:cometocode/src/start/domain/model/start_page_user_response_domain_model.dart';
import 'package:cometocode/src/start/domain/start_page_repository.dart';

class StartPageRepositoryImpl extends StartPageRepository {
  final StartPageDataSource _startPageRemoteDataSource;

  StartPageRepositoryImpl(this._startPageRemoteDataSource);

  Future getApiExample() => _startPageRemoteDataSource.getApiExample();
}
