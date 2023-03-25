import 'dart:developer';

import 'book_model.dart';

class Invoice {
  Book book;
  int quantity;
  double totalPrice;
  double discountRate;
  double taxRate;

  Invoice({
    required this.book,
    required this.quantity,
    required this.totalPrice,
    required this.discountRate,
    required this.taxRate,
  });

  double calculateTotal() {
    double price = ((book.price - book.price * discountRate) * quantity);
    double priceWithTaxes = price * (1 + taxRate);
    return priceWithTaxes;
  }

  //print data class
  void printInvoice() {
    log('$quantity x ${book.name}       ${book.price}\$');
    log('totalPrice x ${calculateTotal()}');
    log('discountRate x $discountRate\$');
    log('taxRate x $taxRate\$');
  }

  void saveToFile(String fileName) {
    log("save file $fileName");
  }
}
