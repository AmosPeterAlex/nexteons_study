// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nexteons_internship_task/screen/student/api_data_grid/controller/api_data_grid_controller.dart';
// // import 'package:nexteons_internship_task/controller/data_grid_controller.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// void main() {
//   runApp(MaterialApp(
//     home: DataGridPage(),
//   ));
// }

// class DataGridPage extends StatelessWidget {
//   final ApiDataGridController controller = Get.put(ApiDataGridController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (controller.hasError.value) {
//           return Center(child: Text('Failed to load data'));
//         } else {
//           return SfDataGrid(
//             source: EmployeeDataSource(
//               employees: controller.dataGridModel.value.data!.dpiRateList!.list!
//                   .map((e) => Employee(
//                         id: e.id ?? '',
//                         name: e.name ?? '',
//                         designation: '',
//                         salary: e.rate ?? 0,
//                       ))
//                   .toList(),
//             ),
//             columns: <GridColumn>[
//               GridColumn(
//                 columnName: 'id',
//                 label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     'ID',
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//               GridColumn(
//                 columnName: 'name',
//                 label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Name',
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//               GridColumn(
//                 columnName: 'designation',
//                 label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Designation',
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//               GridColumn(
//                 columnName: 'salary',
//                 label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     'Salary',
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }
//       }),
//     );
//   }
// }

// class Employee {
//   final String id;
//   final String name;
//   final String designation;
//   final int salary;

//   Employee({
//     required this.id,
//     required this.name,
//     required this.designation,
//     required this.salary,
//   });
// }

// class EmployeeDataSource extends DataGridSource {
//   EmployeeDataSource({required List<Employee> employees}) {
//     dataGridRows = employees
//         .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
//               DataGridCell<String>(columnName: 'id', value: dataGridRow.id),
//               DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
//               DataGridCell<String>(
//                   columnName: 'designation', value: dataGridRow.designation),
//               DataGridCell<int>(
//                   columnName: 'salary', value: dataGridRow.salary),
//             ]))
//         .toList();
//   }

//   List<DataGridRow> dataGridRows = [];

//   @override
//   List<DataGridRow> get rows => dataGridRows;

//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((dataGridCell) {
//       return Container(
//           alignment: (dataGridCell.columnName == 'id' ||
//                   dataGridCell.columnName == 'salary')
//               ? Alignment.centerRight
//               : Alignment.centerLeft,
//           padding: EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             dataGridCell.value.toString(),
//             overflow: TextOverflow.ellipsis,
//           ));
//     }).toList());
//   }
// }
