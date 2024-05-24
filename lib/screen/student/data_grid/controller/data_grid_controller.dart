import 'package:get/get.dart';

import '../../../../model/data_grid_example_model.dart';

class DataGridControler extends GetxController {
  RxList<Employee> getEmployeeData() {
    return [
      Employee(10001, 'Amos', 'Project Lead', 40000),
      Employee(10002, 'Najeeb', 'Manager', 50000),
      Employee(10003, 'Sajin', 'Developer', 50000),
      Employee(10004, 'Sreejith', 'Designer', 50000),
      Employee(10005, 'Anuvind', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ].obs;
  }
  // late EmployeeDataSource employeeDataSource;

  //   List<Employee> employees = <Employee>[];

  // void initState() {
  //   // super.initState();
  //   employees = getEmployeeData();
  //   employeeDataSource = EmployeeDataSource(employees: employees);
  // }

  // List<Employee> getEmployeeData() {
  //   return [
  //     Employee(10001, 'Amos', 'Project Lead', 20000),
  //     Employee(10002, 'Najeeb', 'Manager', 30000),
  //     Employee(10003, 'Sajin', 'Developer', 15000),
  //     Employee(10004, 'Sreejith', 'Designer', 15000),
  //     Employee(10005, 'Martin', 'Developer', 15000),
  //     Employee(10006, 'Newberry', 'Developer', 15000),
  //     Employee(10007, 'Balnc', 'Developer', 15000),
  //     Employee(10008, 'Perry', 'Developer', 15000),
  //     Employee(10009, 'Gable', 'Developer', 15000),
  //     Employee(10010, 'Grimes', 'Developer', 15000)
  //   ];
  // }
}
