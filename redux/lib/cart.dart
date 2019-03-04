import 'package:base/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: StoreConnector<CartState, _VM>(
        converter: (store) => _VM(
            list: store.state.items,
            removeAction: (id) => store.dispatch(CartAction.remove(id))),
        builder: (ctx, vm) => ListView.builder(
              itemCount: vm.list.length,
              itemBuilder: (ctx, idx) => ListTile(
                    title: Text("商品 ${vm.list[idx]}"),
                    onTap: () => vm.removeAction(vm.list[idx]),
                  ),
            ),
      ),
    );
  }
}

typedef void RemoveAction(int id);

class _VM {
  final List<int> list;
  final RemoveAction removeAction;

  _VM({@required this.list, @required this.removeAction});
}
