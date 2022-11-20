import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/counter_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            const Text("You haved pushed the button this many times:"),
            Count(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text("Next Screen"))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key("decrement_FloatingActionButton"),
            onPressed: () => context.read<Counter>().decrement(),
            tooltip: "Decrement",
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            key: const Key("reset_FloatingActionButton"),
            onPressed: () => context.read<Counter>().reset(),
            tooltip: "Reset",
            child: const Icon(Icons.exposure_zero),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            key: const Key("increment_FloatingActionButton"),
            onPressed: () => context.read<Counter>().increment(),
            tooltip: "Increment",
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

class Count extends StatelessWidget {
  Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${context.watch<Counter>().count}",
      key: Key("counterState"),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
