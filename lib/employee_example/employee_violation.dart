
class Employee {
  String id;
  String name;
  double salary;
  String employeeType;

  Employee(
      {required this.id,
      required this.name,
      required this.salary,
      required this.employeeType});

  double calcHoursBonus(double hours) {
    //!change here
    double equation = ((salary / 30) / 8) * hours;
    if (employeeType == 'manager') {
      return equation * 2;
    } else {
      return equation;
    }
  }

  @override
  String toString() {
    return 'Employee id : $id , name : $name';
  }
}
