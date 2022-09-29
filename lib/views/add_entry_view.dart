import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/error_notifier.dart';
import '../data/entry_list_data.dart';

class AddEntryView extends StatelessWidget {
  String newEntryText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('To-do'),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(),
            AddEntryTextField(),
            const SizedBox(height: 10.0),
            AddEntryButton(),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class AddEntryTextField extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<ErrorNotifier>(builder: (context, errorNotifier, child) {
      return TextField(
        maxLength: 31,
        onChanged: (text) {
          Provider.of<EntryListData>(context, listen: false).textfieldText =
              text;
        },
        showCursor: false,
        style: TextStyle(color: Colors.blueGrey[100]),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blueGrey[800],
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange.shade600)),
          contentPadding: const EdgeInsets.all(10.0),
          hintText: 'What are you going to do?',
          hintStyle: TextStyle(color: Colors.blueGrey[200]),
          helperStyle: TextStyle(color: Colors.blueGrey[100]),
          errorText: errorNotifier.emptyEntryWarning,
        ),
      );
    });
  }
}

class AddEntryButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        if (Provider.of<EntryListData>(context, listen: false).textfieldText !=
            '') {
          Provider.of<EntryListData>(context, listen: false).addEntry();
          Navigator.pop(context);
        } else {
          Provider.of<ErrorNotifier>(context, listen: false)
              .addEmptyEntryError = 'Please add something to do.';
        }
      },
      icon: const Icon(Icons.add),
      label: const Text('Add'),
      style: TextButton.styleFrom(primary: Colors.orange[600]),
    );
  }
}
