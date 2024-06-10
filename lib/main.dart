import 'package:flutter/material.dart';
import 'package:pragma_cat/data/repository/cat_reposiroty_impl.dart';
import 'package:pragma_cat/domain/repositories/i_cat_repository.dart';
import 'package:pragma_cat/injection_container.dart';
import 'package:pragma_cat/views/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as inject;

void main() async {
  await inject.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ICatRepository>(create: (_) => CatRepositoryImpl(sl())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cat Breeds',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
