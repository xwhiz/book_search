import 'package:book_search/view_models/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<MainViewModel>(context, listen: false).setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Books"), centerTitle: true),
      body:
          vm.books == null
              ? Center(
                child: Column(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicator(), Text("Loading...")],
                ),
              )
              : Center(child: Text("HEHE")),
    );
  }
}
