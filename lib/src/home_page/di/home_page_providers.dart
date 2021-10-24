import 'package:dio/dio.dart';
import 'package:cometocode/src/home_page/data/home_page_repository_impl.dart';
import 'package:cometocode/src/home_page/data/source/home_page_data_source.dart';
import 'package:cometocode/src/home_page/data/source/home_page_remote_date_source_impl.dart';
import 'package:cometocode/src/home_page/domain/home_page_repository.dart';
import 'package:cometocode/src/home_page/ui/viewmodel/home_page_view_model_main.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:cometocode/src/base/dtx/app_localization_extension.dart';

List<SingleChildWidget> homePageProviders = [
  ..._dependentServices,
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider<Dio, HomePageDataSource>(
    update: (context, client, homePageRemoteDataSource) =>
        HomePageDataSourceImpl(client),
  ),
  ProxyProvider<HomePageDataSource, HomePageRepository>(
    update: (context, homePageRemoteDataSource, homePageUpRepository) =>
        HomePageRepositoryImpl(homePageRemoteDataSource),
  ),
  ChangeNotifierProxyProvider<HomePageRepository, HomePageViewModelMain>(
      create: (context) => HomePageViewModelMain(),
      update: (context, repository, viewModel) =>
          viewModel..update(repository, context.getAppLocalizations())),
];
