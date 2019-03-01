import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (ctx, idx) => ListTile(
            title: Text("商品 $idx"),
            onTap: () => print(idx.toString()),
          ),
    );
  }
}
