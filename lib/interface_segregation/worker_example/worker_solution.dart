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
