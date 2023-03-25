import 'package:flutter/material.dart';
import 'package:solid_principles/single_responsibility/book_example/book_model.dart';
import 'package:solid_principles/single_responsibility/book_example/invoice_solution.dart';
import 'package:solid_principles/single_responsibility/customer_example/customer_solution.dart';

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
      home: const MyHomePage(title: 'Single Responsibility'),
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
  _customerExample() {
    Customer customer = Customer(name: "User name");
    CustomerDB customerDB = CustomerDB();
    customerDB.storeCustomer(customer.name);
    CustomerReportGenerator customerReportGenerator = CustomerReportGenerator();
    customerReportGenerator.generateCustomerReport(customer.name);
  }

  _bookExample() {
    Book book = Book(
        bookId: 1,
        name: "Book name",
        price: 100,
        authorName: "Author name",
        year: 2023);
    Invoice invoice =
        Invoice(book: book, quantity: 10, discountRate: 0.10, taxRate: 0.14);
    InvoicePrinter printer = InvoicePrinter(invoice: invoice);
    InvoiceSaver invoiceSaver = InvoiceSaver(invoice: invoice);
    printer.printInvoice();
    invoiceSaver.saveToFile("download");
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
                  _customerExample();
                },
                child: const Text("Customer Example")),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  _bookExample();
                },
                child: const Text("Book Example")),
          ],
        ),
      ),
    );
  }
}
