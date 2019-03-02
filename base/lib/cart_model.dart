class Cart {
  static final _instance = Cart._();

  factory Cart() {
    return _instance;
  }

  Cart._();

  List<int> _items = [];

  void add(int item) {
    if (_items.indexOf(item) == -1) {
      _items.add(item);
    }
  }

  get list {
    return List.from(_items);
  }

  get count {
    return _items.length;
  }
}
