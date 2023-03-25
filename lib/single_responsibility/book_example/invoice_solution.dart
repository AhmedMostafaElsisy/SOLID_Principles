import 'dart:developer';

import 'book_model.dart';

// 1- create invoice class with one reason to change
class Invoice {
  Book book;
  int quantity;
  double discountRate;
  double taxRate;

  Invoice({
    required this.book,
    required this.quantity,
    required this.discountRate,
    required this.taxRate,
  });

  double calculateTotal() {
    double price = ((book.price - book.price * discountRate) * quantity);
    double priceWithTaxes = price * (1 + taxRate);
    return priceWithTaxes;
  }
}

// 2 - take printInvoice out of class Invoice
class InvoicePrinter {
  Invoice invoice;

  InvoicePrinter({
    required this.invoice,
  });

  void printInvoice() {
    log('${invoice.quantity} x ${invoice.book.name}   ${invoice.book.price}\$');
    log('totalPrice x ${invoice.calculateTotal()}');
    log('discountRate x ${invoice.discountRate}\$');
    log('taxRate x ${invoice.taxRate}\$');
  }
}

// 3 - take saveToFile out of class Invoice
class InvoiceSaver {
  Invoice invoice;

  InvoiceSaver({
    required this.invoice,
  });

  void saveToFile(String filename) {
    log("invoice  save in $filename file");
  }
}
