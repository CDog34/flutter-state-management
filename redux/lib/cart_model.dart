import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class CartState {
  CartState(this.items);

  CartState copyFrom() {
    return CartState(items);
  }

  List<int> items = [];
}

enum CartActionType {
  add,
  remove,
}

class CartAction {
  final CartActionType type;
  final int id;

  CartAction({@required this.type, this.id});

  factory CartAction.add(int id) =>
      CartAction(type: CartActionType.add, id: id);

  factory CartAction.remove(int id) =>
      CartAction(type: CartActionType.remove, id: id);
}

CartState cartReducer(CartState currentState, dynamic action) {
  if (action is! CartAction) return currentState;
  switch (action.type) {
    case CartActionType.add:
      if (currentState.items.indexOf(action.id) != -1) return currentState;
      return currentState.copyFrom()..items.add(action.id);
    case CartActionType.remove:
      if (currentState.items.indexOf(action.id) == -1) return currentState;
      return currentState.copyFrom()..items.remove(action.id);
  }
  return currentState;
}

Store<CartState> getCartStore() {
  return Store<CartState>(cartReducer, initialState: CartState([]));
}
