import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cat/data/datasources/remote/cat_remote_datasource.dart';
import 'package:pragma_cat/data/repository/cat_reposiroty_impl.dart';
import 'package:pragma_cat/domain/repositories/i_cat_repository.dart';
import 'package:pragma_cat/presentation/bloc/catimage/catimage_bloc.dart';
import 'package:pragma_cat/presentation/bloc/catlist/catlist_bloc.dart';
import 'package:pragma_cat/presentation/views/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ICatRepository>(
            create: (_) => CatRepositoryImpl(CatRemoteDataSourceImpl())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CatListBloc(CatRepositoryImpl(CatRemoteDataSourceImpl())),
          ),
          BlocProvider(
            create: (context) =>
                CatImageBloc(CatRepositoryImpl(CatRemoteDataSourceImpl())),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cat Breeds',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
