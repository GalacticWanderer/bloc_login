import 'package:flutter/material.dart';

import 'blocs/provider.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //wrapping the material class with Provider
    //so everything can now access a copy of bloc
    return Provider(
      child: MaterialApp(
        title: "Log me in bloc",
        home: Scaffold(
          appBar: AppBar(
            title: Text("BLoC log in"),
          ),
          body: LoginScreen(),
        ),
      ),
    );
  }
}
