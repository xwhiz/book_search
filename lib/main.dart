import 'package:book_search/view_models/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: ChangeNotifierProvider(
        create: (context) => MainViewModel(),
        child: HomePage(),
      ),
    );
  }
}
