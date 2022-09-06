import 'package:flutter/material.dart';
import './addEntryView.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const TodoEntries(),
      floatingActionButton: addEntryViewButton(context),
    );
  }

  // Widget-metoder
  PreferredSizeWidget appBar() {
    return AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('To-do'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        actions: const [FilterButton()]);
  }

  Widget addEntryViewButton(context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      child: const Icon(Icons.add_rounded, size: 50.0),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddEntryView()));
      },
    );
  }
}

// Klass med state för FilterButton
class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => FilterButtonState();
}

class FilterButtonState extends State<FilterButton> {
  String? filterValue = 'All';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 18.0, top: 5.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const Icon(Icons.filter_alt_rounded),
          iconSize: 30.0,
          iconEnabledColor: Colors.white,
          style: const TextStyle(color: Colors.black),
          items: [filterVal('All'), filterVal('Done'), filterVal('Not done')],
          onChanged: (String? value) {
            setState(() {
              filterValue = value;
            });
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> filterVal(String value) {
    return DropdownMenuItem<String>(value: value, child: Text(value));
  }
}

// Stateful widget för lista med todo-entries

class TodoEntries extends StatefulWidget {
  const TodoEntries({super.key});

  @override
  State<TodoEntries> createState() => _TodoEntriesState();
}

class _TodoEntriesState extends State<TodoEntries> {
  final entries = <String>[
    'Rensa garderoben',
    'Gå ut med hunden',
    'Köpa mjölk',
    'Posta brevet',
    'Slackline med August',
    'Brädspel med Mårten',
    '01234567890123456789012345678901',
    'hej',
    'hej',
    'hej',
  ];

  final isChecked = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, int index) {
              return entry(index);
            },
          ),
        ),
        const SizedBox(height: 90)
      ],
    );
  }

  // Widget-metoder

  Widget entry(int index) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          entryCheckbox(index),
          entryText(index),
          deleteEntryButton(index),
        ],
      ),
    );
  }

  Widget entryCheckbox(int index) {
    return Checkbox(
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked[index],
      onChanged: (bool? newValue) {
        setState(
          () {
            isChecked[index] = newValue!;
          },
        );
      },
    );
  }

  Widget entryText(int index) {
    return Expanded(
      child: Text(
        entries[index],
        style: isChecked[index]
            ? const TextStyle(
                decoration: TextDecoration.lineThrough, color: Colors.grey)
            : const TextStyle(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget deleteEntryButton(int index) {
    return IconButton(
      icon: const Icon(
        Icons.delete_outline,
        size: 30,
      ),
      onPressed: () {
        deleteEntry(entries, index);
      },
    );
  }

  Color getColor(Set<MaterialState> states) {
    return Colors.blueGrey;
  }

  // Funktionella metoder
  void deleteEntry(List entryList, int index) {
    setState(() {
      entryList.removeAt(index);
      isChecked.removeAt(index);
    });
  }
}
