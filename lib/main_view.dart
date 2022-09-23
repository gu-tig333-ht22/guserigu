import 'package:flutter/material.dart';
import 'add_entry_view.dart';
import 'entry_row_widget.dart';
import 'filter_button.dart';
import 'entry_list_data.dart';
import 'package:provider/provider.dart';
import './error_notifier.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('To-do'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
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
      floatingActionButton: Consumer<EntryListData>(
        builder: (context, filterChangeNotifier, child) {
          return FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.add_rounded, size: 50.0),
            onPressed: () async {
              Provider.of<ErrorNotifier>(context, listen: false)
                  .addEmptyEntryError = null;
              String? newEntryText = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddEntryView()));
              if (newEntryText != null) {
                filterChangeNotifier.addEntry(newEntryText);
              }
            },
          );
        },
      ),
    );
  }
}
