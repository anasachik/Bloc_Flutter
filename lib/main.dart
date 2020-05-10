import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomePage.dart';
import 'bloc/weatherbloc_bloc.dart';
import 'data/repositories/repoWeather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
      home: BlocProvider(
        child:HomePage(),
        create: (context) =>WeatherblocBloc(
          RepoWeather()
        ),
      ),
    );
  }
}
