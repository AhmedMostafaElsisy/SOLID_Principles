import 'dart:developer';

abstract class ConnectionInterface {
  void connect();
}

class DbConnection implements ConnectionInterface {
  /// db connection
  @override
  void connect() {
    log('MYSQL Connection');
  }
}

class PasswordReminder {
  /// @var DBConnection
  late ConnectionInterface dbConnection;

  PasswordReminder(this.dbConnection) {
    dbConnection.connect();
  }
}
