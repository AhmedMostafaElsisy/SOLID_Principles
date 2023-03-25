
## Dependency Inversion Principle :

> High-level modules should not depend on low-level modules. Both should depend on abstractions.

> Abstractions should not depend on details. Details should depend on abstractions.

Or simply : Depend on Abstractions not on concretions

By applying the Dependency Inversion the modules can be easily changed by other modules just
changing the dependency module and High-level module will not be affected by any changes to
the Low-level module.

Please look at the following code :

```dart
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

```

There's a common misunderstanding that dependency inversion is simply another way to say dependency injection. However, the two are not the same.

In the above code In spite of Injecting MySQLConnection class in PasswordReminder class but it depends on MySQLConnection.

High-level module PasswordReminder should not depend on low-level module MySQLConnection.

If we want to change the connection from MySQLConnection to MongoDBConnection, we have to change hard-coded constructor injection in PasswordReminder class.

PasswordReminder class should depend upon on Abstractions, not on concretions. But How can we do it? Please see the following example :

```dart
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


```

In the above code, we want to change the connection from MySQLConnection to MongoDBConnection, we no need to change constructor injection in PasswordReminder class. Because here PasswordReminder class depends upon on Abstractions, not on concretions.
