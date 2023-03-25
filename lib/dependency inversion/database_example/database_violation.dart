import 'dart:developer';

class MySQLConnection {
  /// db connection
  void connect() {
    log('MYSQL Connection');
  }
}

class PasswordReminder {
  late MySQLConnection dbConnection;

  PasswordReminder(this.dbConnection);
}
