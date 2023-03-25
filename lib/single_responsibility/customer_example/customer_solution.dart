import 'dart:developer';

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
