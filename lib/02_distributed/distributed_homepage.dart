import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.value,
    required this.incCallBack,
    required this.decCallBack,
  });

  final int value;
  final Function() incCallBack;
  final Function() decCallBack;

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

class DistributedHomepage extends StatefulWidget {
  const DistributedHomepage({super.key});

  @override
  State<DistributedHomepage> createState() => _DistributedHomepageState();
}

class _DistributedHomepageState extends State<DistributedHomepage> {
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;
  int _counter4 = 0;

  void _incCounter1(int amount) {
    setState(() {
      _counter4 += amount;
    });
  }

  void _incCounter2(int amount) {
    setState(() {
      _counter3 += amount;
    });
  }

  void _incCounter3(int amount) {
    setState(() {
      _counter2 += amount;
    });
  }

  void _incCounter4(int amount) {
    setState(() {
      _counter1 += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: SumDisplay(sum: _counter1 + _counter2 + _counter3 + _counter4),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: CounterWidget(
                value: _counter1,
                incCallBack: () {
                  _incCounter1(1);
                },
                decCallBack: () {
                  _incCounter1(-1);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: CounterWidget(
                value: _counter2,
                incCallBack: () {
                  _incCounter2(1);
                },
                decCallBack: () {
                  _incCounter2(-1);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: CounterWidget(
                value: _counter3,
                incCallBack: () {
                  _incCounter3(1);
                },
                decCallBack: () {
                  _incCounter3(-1);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: CounterWidget(
                value: _counter4,
                incCallBack: () {
                  _incCounter4(1);
                },
                decCallBack: () {
                  _incCounter4(-1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
