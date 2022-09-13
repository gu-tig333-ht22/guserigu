import 'package:flutter/material.dart';

class AddEntryView extends StatelessWidget {
  AddEntryView({super.key});

  String newEntryText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('To-do'),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        centerTitle: true);
  }

  Widget body() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Spacer(),
          addEntryTextField(),
          spacing(),
          addEntryButton(),
          Spacer()
        ],
      ),
    );
  }

  // GÖR TILL STATEFUL

  Widget addEntryTextField() {
    return TextField(
      maxLength: 31,
      onChanged: (text) {
        newEntryText = text;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide()),
        contentPadding: EdgeInsets.all(10.0),
        hintText: 'What are you going to do?',
      ),
    );
  }

  Widget addEntryButton() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add),
      label: const Text('Add'),
      style: TextButton.styleFrom(primary: Colors.blueGrey),
    );
  }

  Widget spacing() {
    return const SizedBox(
      height: 10.0,
    );
  }
}
