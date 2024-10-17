import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'John Axcel Cervantes - Card List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Item> items = [
    Item(name: "Axcel", details: "Egg Plant"),
    Item(name: "Dimple", details: "Okra"),
    Item(name: "Joshua", details: "Bingka"),
    Item(name: "Jacob", details: "Saging"),
    Item(name: "Ivan", details: "Nova"),
    Item(name: "Japhet", details: "Pan Cake"),
    Item(name: "Father", details: "T-Shirt"),
    Item(name: "Lian", details: "Hot Dog"),
    Item(name: "Evo", details: "Buko J"),
    Item(name: "Joana", details: "Toron"),
  ];

  void _showDetails(String details) {
    print(details);
  }

  void _addItem(int index) {
    setState(() {
      items[index].isAdded = !items[index].isAdded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('John Axcel Cervantes - Card List Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: items[index].isAdded ? const Color.fromARGB(255, 247, 0, 255) : Colors.white,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(items[index].name),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () => _showDetails(items[index].details),
                                child: Text('Details'),
                              ),
                              TextButton(
                                onPressed: () => _addItem(index),
                                child: Text(items[index].isAdded ? 'Added' : 'Add'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String details;
  bool isAdded;

  Item({required this.name, required this.details, this.isAdded = false});
}
