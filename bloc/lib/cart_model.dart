class Cart {
  Cart(this._items);

  List<int> _items = [];

  Cart add(int item) {
    if (_items.indexOf(item) == -1) {
      _items.add(item);
    }
    return Cart(_items);
  }

  Cart remove(int item) {
    if (_items.indexOf(item) != -1) {
      _items.remove(item);
    }
    return Cart(_items);
  }

  get list {
    return List.from(_items);
  }

  get count {
    return _items.length;
  }
}
