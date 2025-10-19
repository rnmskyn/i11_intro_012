import 'package:flutter/material.dart';

class LocalHomepage extends StatefulWidget {
  const LocalHomepage({super.key});

  @override
  State<LocalHomepage> createState() => _LocalHomepageState();
}

class _LocalHomepageState extends State<LocalHomepage> {
  int _sum = 0;
  List<int> counter = List.filled(4, 0);
  int newValue = 0;

  void incCounter(int index, int amount) {
    setState(() {

      int newIndex = 0;
      
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
      _sum = counter.fold(0, (previous, current) => previous + current);
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
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    iconSize: 40,
                    onPressed: () {
                      incCounter(0, 1);
                      Text("NewValue");
                    },
                   
                  ),
                  ,
              
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 40,
                    onPressed: () {
                      incCounter(0, -1);
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
                      incCounter(1, 1);
                    },
                  ),
                  Text(counter.toString()),
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 40,
                    onPressed: () {
                      incCounter(1, -1);
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
                      incCounter(2, 1);
                    },
                  ),
                  Text(counter.toString()),
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 40,
                    onPressed: () {
                      incCounter(2, -1);
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
                      incCounter(3, 1);
                    },
                  ),
                  Text(counter.toString()),
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 40,
                    onPressed: () {
                      incCounter(3, -1);
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
