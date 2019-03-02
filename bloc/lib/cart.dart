import 'package:base/bloc.dart';
import 'package:base/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<CartBloc>(context),
        builder: (ctx, Cart cart) => ListView.builder(
              itemCount: cart.count,
              itemBuilder: (ctx, idx) => ListTile(
                    title: Text("商品 ${cart.list[idx]}"),
                    onTap: () => BlocProvider.of<CartBloc>(ctx)
                        .dispatch(CartEvent.remove(cart.list[idx])),
                  ),
            ),
      ),
    );
  }
}
