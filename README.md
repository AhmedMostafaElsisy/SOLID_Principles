## Single Responsibility Principle:

>A class should have one, and only one, reason to change.

One class should only serve one purpose, this does not imply that each class should have only one method but they should all relate directly to the responsibility of the class. All the methods and properties should all work towards the same goal. When a class serves multiple purposes or responsibility then it should be made into a new class.

Please look at the following code :

```dart
class Customer {
  String? name;

  //this is a responsibility
  void storeCustomer(String customerName) {
    log("store customer :  $customerName");
  }

  //this is another responsibility
  void generateCustomerReport(String customerName) {
    log("generate report for customer : $customerName");

  }
}
```

Above class violates single responsibility principle. Why should this class store data in database? It is related to the
persistence layer. The persistence layer deals with persisting is model class.So it is not the responsibility of this class.

Next method generateCustomerReport is also not the responsibility of this class. Because we may need report.

So finally the refactored code will be described as below :

```dart
class Customer {
  String name;

  Customer({required this.name});
}

class CustomerDB {
  void storeCustomer(String customerName) {
    log("store customer :  $customerName");
  }
}

class CustomerReportGenerator {
  void generateCustomerReport(String customerName) {
    log("generate report for customer : $customerName");
  }
}
```
