import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/error_notifier.dart';
import 'views/main_view.dart';
import 'data/entry_list_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => EntryListData()),
      ChangeNotifierProvider(create: (context) => ErrorNotifier())
    ], child: MainView());
  }
}
