import 'package:base/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './cart_model.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (ctx, idx) => ListTile(
            title: Text("商品 $idx"),
            onTap: () =>
                BlocProvider.of<CartBloc>(context).dispatch(CartEvent.add(idx)),
          ),
    );
  }
}
