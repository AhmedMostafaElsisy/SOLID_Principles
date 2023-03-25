import 'package:flutter/material.dart';

import 'dependency inversion/database_example/database_solution.dart';
import 'dependency inversion/delivery_example/delivery_solution.dart';

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
      home: const MyHomePage(title: 'Dependency Inversion '),
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
  _dataBaseExample() {
    PasswordReminder passwordReminder = PasswordReminder(DbConnection());
  }

  _deliveryExample() {
    DeliveryCompany company = DeliveryCompany(DeliveryDriver());
    company.sendProduct(Product());
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
                  _dataBaseExample();
                },
                child: const Text("DataBase Example")),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  _deliveryExample();
                },
                child: const Text("Delivery Example")),
          ],
        ),
      ),
    );
  }
}
