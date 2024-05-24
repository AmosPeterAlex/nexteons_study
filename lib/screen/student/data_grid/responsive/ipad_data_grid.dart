// import 'package:flutter/material.dart';
// import 'package:nexteons_internship_task/model/data_grid_model.dart';
// import 'package:nexteons_internship_task/screen/student/data_grid/controller/data_source.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class IPadDataGrid extends StatefulWidget {
//   IPadDataGrid({super.key});

//   @override
//   State<IPadDataGrid> createState() => _IPadDataGridState();
// }

// class _IPadDataGridState extends State<IPadDataGrid> {
//   final DataGridController controller = DataGridController();
//   late EmployeeDataSource employeeDataSource;

//   List<Employee> employees = <Employee>[];

//   @override
//   void initState() {
//     super.initState();
//     employees = getEmployeeData();
//     employeeDataSource = EmployeeDataSource(employees: employees);
//   }

//   List<Employee> getEmployeeData() {
//     return [
//       Employee(10001, 'Amos', 'Project Lead', 20000),
//       Employee(10002, 'Najeeb', 'Manager', 30000),
//       Employee(10003, 'Sajin', 'Developer', 15000),
//       Employee(10004, 'Sreejith', 'Designer', 15000),
//       Employee(10005, 'Martin', 'Developer', 15000),
//       Employee(10006, 'Newberry', 'Developer', 15000),
//       Employee(10007, 'Balnc', 'Developer', 15000),
//       Employee(10008, 'Perry', 'Developer', 15000),
//       Employee(10009, 'Gable', 'Developer', 15000),
//       Employee(10010, 'Grimes', 'Developer', 15000)
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SfDataGrid(
//         source: employeeDataSource,
//         columns: [
//           GridColumn(
//               columnName: 'id',
//               label: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     'ID',
//                     overflow: TextOverflow.ellipsis,
//                   ))),
//           GridColumn(
//               columnName: 'name',
//               label: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Name',
//                     overflow: TextOverflow.ellipsis,
//                   ))),
//           GridColumn(
//               columnName: 'designation',
//               label: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Designation',
//                     overflow: TextOverflow.ellipsis,
//                   ))),
//           GridColumn(
//               columnName: 'salary',
//               label: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     'Salary',
//                     overflow: TextOverflow.ellipsis,
//                   ))),
//         ],
//         selectionMode: SelectionMode.multiple,
//         controller: controller,
//       ),
//     );
//   }
// }
