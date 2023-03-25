abstract class Employee {
  int id;
  String name;
  double salary;

  Employee({
    required this.id,
    required this.name,
    required this.salary,
  });

  double calcHoursBonus(double hours);

  @override
  String toString() {
    return 'Employee id : $id , name : $name';
  }
}

class Manager extends Employee {
  Manager({
    required super.id,
    required super.name,
    required super.salary,
  });

  @override
  double calcHoursBonus(double hours) {
    double equation = ((salary / 30) / 8) * hours;
    return equation * 2;
  }
}

class RegularEmp extends Employee {
  RegularEmp({
    required super.id,
    required super.name,
    required super.salary,
  });

  @override
  double calcHoursBonus(double hours) {
    double equation = ((salary / 30) / 8) * hours;
    return equation;
  }
}
