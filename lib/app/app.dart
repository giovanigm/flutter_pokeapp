import 'package:flutter/material.dart' hide Router;

import 'router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = Router();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'PokeApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.red,
            accentColor: Colors.red));
  }
}
