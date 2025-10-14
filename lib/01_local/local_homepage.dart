import 'package:flutter/material.dart';

class LocalHomepage extends StatefulWidget {
  const LocalHomepage({super.key});

  @override
  State<LocalHomepage> createState() => _LocalHomepageState();
}

class _LocalHomepageState extends State<LocalHomepage> {
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;
  int _counter4 = 0;
  int _sum = 0;

  void _incCounter1(int amount) {
    setState(() {
      _counter4 += amount;
      _sum += amount;
    });
  }

  void _incCounter2(int amount) {
    setState(() {
      _counter3 += amount;
      _sum += amount;
    });
  }

  void _incCounter3(int amount) {
    setState(() {
      _counter2 += amount;
      _sum += amount;
    });
  }

  void _incCounter4(int amount) {
    setState(() {
      _counter1 += amount;
      _sum += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(_sum.toString()),
            const Text("Overengineered Counter"),
            Text(_sum.toString()),
          ],
        ),
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
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    iconSize: 40,
                    onPressed: () {
                      _incCounter1(1);
                    },
                  ),
                  Text(_counter1.toString()),
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 40,
                    onPressed: () {
                      _incCounter1(-1);
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    iconSize: 40,
                    onPressed: () {
                      _incCounter2(1);
                    },
                  ),
                  Text(_counter2.toString()),
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 40,
                    onPressed: () {
                      _incCounter2(-1);
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    iconSize: 40,
                    onPressed: () {
                      _incCounter3(1);
                    },
                  ),
                  Text(_counter3.toString()),
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 40,
                    onPressed: () {
                      _incCounter3(-1);
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    iconSize: 40,
                    onPressed: () {
                      _incCounter4(1);
                    },
                  ),
                  Text(_counter4.toString()),
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 40,
                    onPressed: () {
                      _incCounter4(-1);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
