import 'package:base/cart_model.dart';

import './cart.dart';

import './list.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Store<CartState> _store = getCartStore();

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CartState>(
      store: _store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          StoreConnector<CartState, int>(
            converter: (store) => store.state.items.length,
            builder: (ctx, count) => BadgeIconButton(
                  itemCount: count,
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => CartPage())),
                ),
          )
        ],
      ),
      body: ListPage(),
    );
  }
}
