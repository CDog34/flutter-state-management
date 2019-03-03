class Cart {
  Cart(this._items);

  Cart.from(Cart old) {
    _items = List.from(old.list);
  }

  List<int> _items = [];

  void add(int item) {
    if (_items.indexOf(item) == -1) {
      _items.add(item);
    }
  }

  void remove(int item) {
    if (_items.indexOf(item) != -1) {
      _items.remove(item);
    }
  }

  get list {
    return List.from(_items);
  }

  get count {
    return _items.length;
  }
}
