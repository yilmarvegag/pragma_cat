import 'package:get_it/get_it.dart';
import 'package:pragma_cat/data/datasources/remote/cat_remote_datasource.dart';
import 'package:pragma_cat/data/repository/cat_reposiroty_impl.dart';
import 'package:pragma_cat/domain/repositories/i_cat_repository.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  initRepository();
  initRemoteRepository();
  initExternalLibraries();
}

///
///Inject repostories
///
Future<void> initRepository() async {
  sl.registerLazySingleton<ICatRepository>(() => CatRepositoryImpl(sl()));
}

///
///Inject remote repository
///
Future<void> initRemoteRepository() async {
  sl.registerLazySingleton<CatRemoteDataSource>(
      () => CatRemoteDataSourceImpl(sl()));
}

///
/// Inject client
///
Future<void> initExternalLibraries() async {
  sl.registerLazySingleton(() => http.Client());
}
