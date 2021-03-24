
import 'package:aspod/bloc/data_bloc/databloc_bloc.dart';
import 'package:aspod/repositories/repository.dart';
import 'package:aspod/services/locator.dart';
import 'package:aspod/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (context)=> DatablocBloc(Repository()),
          child: Home(),
        ),
      
    );
  }
}
