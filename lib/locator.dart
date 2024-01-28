import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:urlshortener/src/shortener/data/datasource/remote/urlshort_source.dart';
import 'package:urlshortener/src/shortener/data/repository/url_repo.dart';
import 'package:urlshortener/src/shortener/domain/repository/url_shortner_repo.dart';
import 'package:urlshortener/src/shortener/domain/usecase/urlshort_usecase.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // external
  sl.registerLazySingleton(() => http.Client());

  // ============ BLOCS ============
  sl.registerFactory(() => UrlShortenerBloc(sl()));

  // ============ USECASES ============
  sl.registerLazySingleton(() => UrlShortnerUseCase(sl()));

  // ============ REPOSITORIES ============
  sl.registerLazySingleton<UrlShortnerRepository>(() => UrlShortDataSourceImpl(sl()));

  // ============ REMOTE DATASOURCES ============
  sl.registerLazySingleton(() => RemoteUrlShortDataSourceImpl(sl()));
  sl.registerLazySingleton<RemoteUrlShortDataSource>(() => RemoteUrlShortDataSourceImpl(sl()));
}
