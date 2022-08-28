import 'package:flutter/material.dart';

import '../features/auth/presentation/login_page/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Product Sans"),
      home: const LoginPage(),
    );
  }
}
