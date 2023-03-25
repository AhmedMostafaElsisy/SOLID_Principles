import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:solid_principles/open_close_example/shape_solution.dart';

import 'employee_example/employee_solution.dart';

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
      home: const MyHomePage(title: 'Open - Close'),
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
  _shapeExample() {
    Rectangle rec = Rectangle(width: 23, length: 4);
    Circle circle = Circle(radius: 10);
    ShapeDrawer drawer = ShapeDrawer();
    drawer.drawShape(rec);
    drawer.drawShape(circle);
  }

  _employeeExample() {
    Employee emp1 = Manager(id: 1, name: 'manger name', salary: 1000);
    Employee emp2 = RegularEmp(id: 2, name: 'employee name', salary: 1000);

    log("$emp1 Bonus : ${emp1.calcHoursBonus(5)}");
    log("$emp2 Bonus : ${emp2.calcHoursBonus(5)}");
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
                  _shapeExample();
                },
                child: const Text("Shape Example")),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  _employeeExample();
                },
                child: const Text("Employee Example")),
          ],
        ),
      ),
    );
  }
}
