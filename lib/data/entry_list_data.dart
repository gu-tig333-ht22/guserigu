import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/entry.dart';
import 'http_connection.dart';

class EntryListData extends ChangeNotifier {
  String? _filterBy = 'All';

  String textfieldText = '';

  // ignore: prefer_final_fields
  List<Entry> _entryList = [];

  String? get filter => _filterBy;
  List get entryList => _entryList;

  EntryListData() {
    fetchEntries();
  }

  addEntry() async {
    List jsonList = await HttpConnection.postEntry(textfieldText);
    _entryList = jsonToEntryList(jsonList);
    textfieldText = '';
    notifyListeners();
  }

  fetchEntries() async {
    List jsonList = await HttpConnection.fetchData();
    _entryList = jsonToEntryList(jsonList);
    notifyListeners();
  }

  changeDone(String id, String entryText, bool? done) async {
    List jsonList = await HttpConnection.updateEntry(id, entryText, done);
    _entryList = jsonToEntryList(jsonList);
    notifyListeners();
  }

  deleteEntry(String id) async {
    List jsonList = await HttpConnection.deleteEntry(id);
    _entryList = jsonToEntryList(jsonList);
    notifyListeners();
  }

  set filter(String? newFilter) {
    _filterBy = newFilter;
    notifyListeners();
  }

  List<Entry> filteredList() {
    if (_filterBy == 'Done') {
      return _entryList.where((entry) => entry.isDone == true).toList();
    } else if (_filterBy == 'Not done') {
      return _entryList.where((entry) => entry.isDone == false).toList();
    } else {
      return _entryList.toList();
    }
  }

  List<Entry> jsonToEntryList(List jsonList) {
    List<Entry> entryList = [];

    for (Map<String, dynamic> jsonEntry in jsonList) {
      entryList.add(Entry.fromJson(jsonEntry));
    }
    return entryList;
  }
}
