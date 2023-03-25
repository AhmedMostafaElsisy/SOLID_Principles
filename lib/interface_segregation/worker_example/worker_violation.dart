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
