import 'package:cometocode/src/start/data/source/start_page_data_source.dart';
import 'package:cometocode/src/start/data/source/start_page_date_source_impl.dart';
import 'package:cometocode/src/start/data/start_page_repository_impl.dart';
import 'package:cometocode/src/start/domain/start_page_repository.dart';
import 'package:cometocode/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:dio/dio.dart';
import 'package:cometocode/src/base/dtx/app_localization_extension.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> startPageProviders = [
  ..._dependentServices,
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider0<Dio>(update: (_, __) => Dio()),
  ProxyProvider<Dio, StartPageDataSource>(
    update: (context, client, baseRemoteDataSource) =>
        StartPageDataSourceImpl(client),
  ),
  ProxyProvider<StartPageDataSource, StartPageRepository>(
    update: (context, baseRemoteDataSource, baseUpRepository) =>
        StartPageRepositoryImpl(baseRemoteDataSource),
  ),
  ChangeNotifierProxyProvider<StartPageRepository, StartPageViewModelMain>(
    create: (context) => StartPageViewModelMain(),
    update: (
      context,
      repository,
      previous,
    ) =>
        previous
          ..update(
            context,
            repository,
            context.getAppLocalizations(),
          ),
  ),
];
