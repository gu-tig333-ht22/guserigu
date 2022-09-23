import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'entry_list_data.dart';

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      margin: const EdgeInsets.only(right: 23.0, top: 5.0),
      child: Consumer<EntryListData>(builder: (context, entryViewData, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButton(
            focusColor: Colors.blueGrey,
            autofocus: false,
            isExpanded: true,
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
              entryViewData.filter = value;
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
