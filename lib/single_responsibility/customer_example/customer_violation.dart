import 'dart:developer';

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
