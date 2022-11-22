import 'dart:io';

import 'package:apibloc/App.dart';
import 'package:apibloc/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  }
  // createHttpClient(SecurityContext context){
  //   return super.createHttpClient(context)
  //     ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  // }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ApiBloc(),
        )
      ],
      child: MaterialApp(
        home: App(),
      ),
    );
  }
}
