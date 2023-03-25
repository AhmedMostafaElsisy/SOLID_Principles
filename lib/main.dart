import 'package:flutter/material.dart';

import 'interface_segregation/parking_example/parking_solution.dart';
import 'interface_segregation/worker_example/worker_solution.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Interface Segregation '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _workerExample() {
    HumanWorker humanWorker = HumanWorker();
    humanWorker.sleep();
    humanWorker.work();
    RobotWorker robotWorker = RobotWorker();
    robotWorker.work();
  }

  _parkingExample() {
    FreeParking freeParking =FreeParking();
    freeParking.parkCar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _workerExample();
                },
                child: const Text("Worker Example")),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  _parkingExample();
                },
                child: const Text("Parking Example")),
          ],
        ),
      ),
    );
  }
}
