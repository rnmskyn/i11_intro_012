import 'package:flutter/material.dart';

class StateArguments {
  StateArguments({
    required this.value,
    required this.incCallBack,
    required this.decCallBack,
  });
  int value;
  VoidCallback incCallBack;
  VoidCallback decCallBack;
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key, required this.stateArguments});

  final StateArguments stateArguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_upward),
            iconSize: 40,
            onPressed: stateArguments.incCallBack,
          ),
          Text(stateArguments.value.toString()),
          IconButton(
            icon: const Icon(Icons.arrow_downward),
            iconSize: 40,
            onPressed: stateArguments.decCallBack,
          ),
        ],
      ),
    );
  }
}

class SumDisplay extends StatelessWidget {
  final int sum;

  const SumDisplay({super.key, required this.sum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(sum.toString()),
        const Text("Overengineered Counter"),
        Text(sum.toString()),
      ],
    );
  }
}

class DistributedRow extends StatelessWidget {
  const DistributedRow({
    super.key,
    required this.firstCounterArgs,
    required this.secondCounterArgs,
  });

  final StateArguments firstCounterArgs;
  final StateArguments secondCounterArgs;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CounterWidget(stateArguments: firstCounterArgs),
        CounterWidget(stateArguments: secondCounterArgs),
      ],
    );
  }
}

class DistributedPassiveHomepage extends StatefulWidget {
  const DistributedPassiveHomepage({super.key});

  @override
  State<DistributedPassiveHomepage> createState() =>
      _DistributedPassiveHomepageState();
}

class _DistributedPassiveHomepageState
    extends State<DistributedPassiveHomepage> {
  List<int> counter = List.filled(2, 0);

  void _incCounter(int index, int amount) {
    int newIndex = 0;
    setState(() {
      if (index == 0) {
        newIndex = 1;
      } else if (index == 1) {
        newIndex = 0;
      } else {
        throw UnimplementedError("Index is out of range");
      }
      counter[newIndex] += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: SumDisplay(sum: counter[0] + counter[1]),
      ),
      body: Center(
        child: DistributedRow(
          firstCounterArgs: StateArguments(
            value: counter[0],
            incCallBack: () => _incCounter(0, 1),
            decCallBack: () => _incCounter(0, -1),
          ),
          secondCounterArgs: StateArguments(
            value: counter[1],
            incCallBack: () => _incCounter(1, 1),
            decCallBack: () => _incCounter(1, -1),
          ),
        ),
      ),
    );
  }
}
