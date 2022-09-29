import 'package:flutter/material.dart';
import 'add_entry_view.dart';
import '../components/entry_row_widget.dart';
import '../data/entry_list_data.dart';
import 'package:provider/provider.dart';
import '../data/error_notifier.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-do',
      theme: ThemeData(
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Colors.orange[600]),
          checkColor: MaterialStateProperty.all(Colors.orange[600]),
        ),
        scaffoldBackgroundColor: Colors.blueGrey[700],
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 15.0, color: Colors.blueGrey[100]),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text('To-do'),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            actions: [FilterButton()]),
        body: Column(
          children: [
            Expanded(
              child: Consumer<EntryListData>(
                builder: (context, entryListData, child) {
                  return ListView(
                    children: entryListData
                        .filteredList()
                        .map((entry) => EntryRow(entry))
                        .toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 90)
          ],
        ),
        floatingActionButton: ToAddEntryViewButton(),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 23.0, top: 5.0),
      child: Consumer<EntryListData>(builder: (context, entryListData, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text(
              entryListData.filter!,
              style: TextStyle(color: Colors.blueGrey[50]),
            ),
            focusColor: Colors.blueGrey,
            borderRadius: BorderRadius.circular(30),
            icon: const Icon(Icons.filter_alt_rounded),
            iconSize: 30.0,
            iconEnabledColor: Colors.blueGrey[50],
            style: TextStyle(color: Colors.blueGrey[50]),
            dropdownColor: Colors.blueGrey[700],
            alignment: AlignmentDirectional.centerEnd,
            items: [
              filterVal('All', context),
              filterVal('Done', context),
              filterVal('Not done', context)
            ],
            onChanged: (String? value) {
              entryListData.filter = value;
            },
          ),
        );
      }),
    );
  }

  DropdownMenuItem<String> filterVal(String value, context) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style:
            value == Provider.of<EntryListData>(context, listen: false).filter
                ? TextStyle(color: Colors.orange[600])
                : const TextStyle(),
      ),
    );
  }
}

class ToAddEntryViewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add_rounded, size: 50.0),
        onPressed: () {
          Provider.of<ErrorNotifier>(context, listen: false)
              .addEmptyEntryError = null;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddEntryView()));
        });
  }
}
