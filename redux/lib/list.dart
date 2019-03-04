import 'package:base/cart_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemBuilder: (ctx, idx) => StoreConnector<CartState, VoidCallback>(
              converter: (store) => () => store.dispatch(CartAction.add(idx)),
              builder: (ctx, action) => ListTile(
                    title: Text("商品 $idx"),
                    onTap: action,
                  ),
            ));
  }
}
