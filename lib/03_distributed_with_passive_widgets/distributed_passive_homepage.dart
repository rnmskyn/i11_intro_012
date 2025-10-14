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
    return Row(
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
  State<DistributedPassiveHomepage> createState() => _DistributedPassiveHomepageState();
}

class _DistributedPassiveHomepageState extends State<DistributedPassiveHomepage> {
  int _counter1 = 0;
  int _counter2 = 0;

  void _incCounter1(int amount) {
    setState(() {
      _counter2 += amount;
    });
  }

  void _incCounter2(int amount) {
    setState(() {
      _counter1 += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: SumDisplay(sum: _counter1 + _counter2),
      ),
      body: Center(
        child: DistributedRow(
          firstCounterArgs: StateArguments(
            value: _counter1,
            incCallBack: () {
              _incCounter1(1);
            },
            decCallBack: () {
              _incCounter1(-1);
            },
          ),
          secondCounterArgs: StateArguments(
            value: _counter2,
            incCallBack: () {
              _incCounter2(1);
            },
            decCallBack: () {
              _incCounter2(-1);
            },
          ),
        ),
      ),
    );
  }
}
