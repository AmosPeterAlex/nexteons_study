import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/controller/api_data_grid_controller.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/controller/api_data_grid_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ApiDataGridMac extends StatelessWidget {
  final ApiDataGridController controller;
  ApiDataGridMac({super.key, required this.controller});

  // final controller = Get.put(ApiDataGridController());
 // List<ListElement> apiData = <ListElement>[].obs;

  // late ApiDataGridSource apiDataGridSource;

  // @override
  // void initState() {
  //   // apiData = controller.onApiGridDataGet() as List<ListElement>;
  //   // apiDataGridSource = ApiDataGridSource(apiData);

  //   super.initState();
  //   controller.onApiGridDataGet();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // final apiDataGridSource=ApiDataGridSource(controller.DpiRateList);
      // final ApiDataGridSource= ApiDataGridSource
      body: Obx(() {
        final apiDataGridSource = ApiDataGridSource(controller.dpiRateList);
        return SfDataGrid(
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          source: apiDataGridSource,
          columns: [
            GridColumn(
              columnName: 'id',
              label: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerRight,
                child: Text(
                  'ID',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              columnName: 'name',
              label: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              columnName: 'rate',
              label: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerRight,
                child: Text(
                  'Rate',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

//circular progress indicator added
// class ApiDataGridMac extends StatefulWidget {
//   ApiDataGridMac({super.key});
//
//   @override
//   State<ApiDataGridMac> createState() => _ApiDataGridMacState();
// }
//
// class _ApiDataGridMacState extends State<ApiDataGridMac> {
//   final controller = Get.put(ApiDataGridController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Data Grid Example')),
//       body: Obx(() {
//         if (controller.DpiRateList.isEmpty) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         final apiDataGridSource = ApiDataGridSource(controller.DpiRateList);
//
//         return SfDataGrid(
//           source: apiDataGridSource,
//           columns: [
//             GridColumn(
//               columnName: 'id',
//               label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'ID',
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//             GridColumn(
//               columnName: 'name',
//               label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Name',
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//             GridColumn(
//               columnName: 'rate',
//               label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'Rate',
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
