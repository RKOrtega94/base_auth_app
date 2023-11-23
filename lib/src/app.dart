import 'package:base_auth_app/src/presentation/router/_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Base Auth App",
      routerConfig: router,
    );
  }
}
