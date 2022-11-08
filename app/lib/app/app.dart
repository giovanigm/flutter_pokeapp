import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'route_config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokeapp',
      debugShowCheckedModeBanner: false,
      theme: PokedexTheme.lightTheme,
      initialRoute: RouteConfig.initialRoute,
      onGenerateRoute: RouteConfig.generateRoutes,
    );
  }
}
