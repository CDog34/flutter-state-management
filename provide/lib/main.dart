import './cart_model.dart';

import './cart.dart';

import './list.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provide/provide.dart';

void main() {
  final providers = Providers()..provide(Provider.function((ctx) => Cart()));
  runApp(ProviderNode(
    providers: providers,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
          Provide<Cart>(
            builder: (ctx, _, cart) => BadgeIconButton(
                  itemCount: cart.count,
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
