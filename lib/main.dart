import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'package:template/error_notifier.dart';
import 'main_view.dart';
import 'entry_view_data.dart';
=======
import './mainView.dart';
>>>>>>> 395154979c8e418a697c1448491544979d661216

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EntryViewData()),
        ChangeNotifierProvider(create: (context) => ErrorNotifier())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'To-do',
          theme: ThemeData(
            checkboxTheme: CheckboxThemeData(
                fillColor: MaterialStateProperty.all(Colors.orange[600])),
            scaffoldBackgroundColor: Colors.blueGrey[700],
            textTheme: TextTheme(
              bodyText2: TextStyle(fontSize: 15.0, color: Colors.blueGrey[100]),
            ),
          ),
          home: const MainView()),
    );
=======
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-do',
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText2: TextStyle(fontSize: 15.0),
          ),
        ),
        home: const MainView());
>>>>>>> 395154979c8e418a697c1448491544979d661216
  }
}
