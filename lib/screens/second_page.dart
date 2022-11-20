import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/shopping_cart_provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Provider App"),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Items: ${context.watch<ShoppingCart>().shoppingCart}"),
              Text("Count: ${context.watch<ShoppingCart>().count}")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          key: const Key("add_item_FloatingActionButton"),
          onPressed: () => context.read<ShoppingCart>().addItem("Bread"),
          tooltip: "Add Item",
          child: const Icon(Icons.add),
        ));
  }
}
