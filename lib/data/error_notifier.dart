import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorNotifier extends ChangeNotifier {
  String? _emptyEntryWarning;

  String? get emptyEntryWarning => _emptyEntryWarning;

  set addEmptyEntryError(String? msg) {
    _emptyEntryWarning = msg;
    notifyListeners();
  }
}
