import 'package:base/cart_model.dart';
import 'package:bloc/bloc.dart';

enum CartEventType { add, remove }

class CartEvent {
  CartEventType type;
  int id;

  CartEvent(this.type, {this.id});

  factory CartEvent.add(int id) => CartEvent(CartEventType.add, id: id);

  factory CartEvent.remove(int id) => CartEvent(CartEventType.remove, id: id);
}

class CartBloc extends Bloc<CartEvent, Cart> {
  @override
  Cart get initialState => Cart([]);

  @override
  Stream<Cart> mapEventToState(Cart currentState, CartEvent event) async* {
    switch (event.type) {
      case CartEventType.add:
//        await Future.delayed(Duration(seconds: 1));
        yield Cart.from(currentState)..add(event.id);
//        await Future.delayed(Duration(seconds: 1));
//        yield Cart.from(currentState)..remove(event.id);
        break;
      case CartEventType.remove:
        yield Cart.from(currentState)..remove(event.id);
    }
  }
}
