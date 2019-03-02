import './cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Provide<Cart>(
        builder: (ctx, _, cart) => ListView.builder(
            itemCount: cart.count,
            itemBuilder: (ctx, idx) => ListTile(
                  title: Text("商品 ${cart.list[idx]}"),
                  onTap: () => cart.remove(cart.list[idx]),
                )),
      ),
    );
  }
}
