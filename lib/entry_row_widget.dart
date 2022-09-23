import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'entry_list_data.dart';
import './entry.dart';

class EntryRow extends StatelessWidget {
  final Entry entry;

  EntryRow(this.entry);

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryListData>(
        builder: (context, filterChangeNotifier, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          padding:
              const EdgeInsets.only(top: 5.0, bottom: 5, right: 10, left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueGrey[800]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              entryCheckbox(context),
              entryTextWidget(),
              deleteEntryButton(context),
            ],
          ),
        ),
      );
    });
  }

  Widget entryCheckbox(context) {
    return Checkbox(
      checkColor: Colors.orange[600],
      activeColor: Colors.blueGrey[800],
      value: entry.isDone,
      onChanged: (bool? newValue) {
        Provider.of<EntryListData>(context, listen: false)
            .changeDone(entry.id, entry.entryText, newValue!);
      },
    );
  }

  Widget entryTextWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          entry.entryText,
          style: entry.isDone!
              ? const TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.white24)
              : const TextStyle(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget deleteEntryButton(context) {
    return IconButton(
      icon: Icon(
        Icons.delete_outline,
        color: Colors.orange[600],
        size: 30,
      ),
      onPressed: () {
        Provider.of<EntryListData>(context, listen: false)
            .deleteEntry(entry.id);
      },
    );
  }
}
