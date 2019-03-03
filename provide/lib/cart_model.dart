import 'package:flutter/widgets.dart';

class Cart with ChangeNotifier {
  static final _instance = Cart._();

  factory Cart() {
    return _instance;
  }

  Cart._();

  List<int> _items = [];

  void add(int item) {
    if (_items.indexOf(item) == -1) {
      _items.add(item);
      notifyListeners();
    }
  }

  void remove(int item) {
    if (_items.indexOf(item) != -1) {
      _items.remove(item);
      notifyListeners();
    }
  }

  List<int> get list {
    return List.from(_items);
  }

  get count {
    return _items.length;
  }
}
