import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.value,
    required this.incCallBack,
    required this.decCallBack,
  });

  final int value;
  final VoidCallback incCallBack;
  final VoidCallback decCallBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_upward),
          iconSize: 40,
          onPressed: incCallBack,
        ),
        Text(value.toString()),
        IconButton(
          icon: const Icon(Icons.arrow_downward),
          iconSize: 40,
          onPressed: decCallBack,
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(sum.toString()),
        const Text("Overengineered Counter"),
        Text(sum.toString()),
      ],
    );
  }
}

class GridCell extends StatelessWidget {
  const GridCell({
    super.key,
    required this.value,
    required this.incCallBack,
    required this.decCallBack,
    this.color,
  });
  final int value;
  final VoidCallback incCallBack;
  final VoidCallback decCallBack;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: color ?? Colors.blueAccent,
      child: CounterWidget(
        value: value,
        incCallBack: incCallBack,
        decCallBack: decCallBack,
      ),
    );
  }
}

class DistributedHomepage extends StatefulWidget {
  const DistributedHomepage({super.key});

  @override
  State<DistributedHomepage> createState() => _DistributedHomepageState();
}

class _DistributedHomepageState extends State<DistributedHomepage> {
  List<int> counter = List.filled(4, 0);

  void _incCounter(int index, int amount) {
    int newIndex = 0;
    setState(() {
      switch (index) {
        case 0:
          newIndex = 3;
          break;
        case 1:
          newIndex = 2;
          break;
        case 2:
          newIndex = 1;
          break;
        case 3:
          newIndex = 0;
          break;
      }
      counter[newIndex] += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: SumDisplay(
          sum: counter.fold(0, (previous, current) => previous + current),
        ),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(counter.length, (index) {
            return GridCell(
              value: counter[index],
              incCallBack: () => _incCounter(index, 1),
              decCallBack: () => _incCounter(index, -1),
            );
          }),
        ),
      ),
    );
  }
}
