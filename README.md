
## Interface Segregation Principle :

>A Client should not be forced to implement an interface that it doesn't use.

This rule means that we should break our interfaces in many smaller ones,
so they better satisfy the exact needs of our clients.

Similar to the Single Responsibility Principle, the goal of the Interface Segregation Principle is to minimize the side consequences and repetition by dividing the software into multiple, independent parts.

Let’s see an example :

```dart
import 'dart:developer';

abstract class WorkerInterface {
  void work();

  void sleep();
}

class HumanWorker implements WorkerInterface {
  @override
  void work() {
    log('works');
  }

  @override
  void sleep() {
    log('sleep');
  }
}

class RobotWorker implements WorkerInterface {
  @override
  void work() {
    log('works');
  }

  @override
  void sleep() {
    throw Exception("robot don't sleep");
  }
}


```

In the above code, RobotWorker no needs sleep, but the class has to implement the sleep method because we know that all methods are abstract in the interface. It breaks the Interface segregation law. How we can fix it please see the following code :

```dart
import 'dart:developer';

abstract class WorkAbleInterface {
  void work();
}

abstract class SleepAbleInterface {
  void sleep();
}

class HumanWorker implements WorkAbleInterface, SleepAbleInterface {
  @override
  void work() {
    log('human works');
  }

  @override
  void sleep() {
    log('human sleep');
  }
}

class RobotWorker implements WorkAbleInterface {
  @override
  void work() {
    log('robot works');
  }
}


```
