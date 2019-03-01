import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) => ListTile(
              title: Text("商品 $idx"),
              onTap: () => print(idx.toString()),
            ),
      ),
    );
  }
}
