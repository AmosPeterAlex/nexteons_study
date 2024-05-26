import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/model/api_data_grid_model.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/controller/api_data_grid_controller.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/widgets/data_alert_box.dart';
import 'package:nexteons_internship_task/utils/constants/app_constants.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ApiDataGridSource extends DataGridSource {
  List<DataGridRow> dataGridRows = [];

  final ApiDataGridController controller;

  ApiDataGridSource(this.controller) {
    dataGridRows = controller.dpiRateList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: dataGridRow.id),
        DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
        DataGridCell<int>(columnName: 'rate', value: dataGridRow.rate),
        DataGridCell<Widget>(
          columnName: 'edit',
          value: IconButton(
            onPressed: () {
              print("edit");
              showDialog(
                context: navigatorKey.currentContext!,
                builder: (context) {
                  return DataAlertBox(
                      controller: controller,
                      id: dataGridRow.id,
                      name: dataGridRow.name,
                      rate: dataGridRow.rate.toString(),
                      onPressed: () {
                        controller.editData(id: dataGridRow.id);
                      });
                },
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ),
        DataGridCell<Widget>(
          columnName: 'delete',
          value: IconButton(
            onPressed: () {
              controller.delete(id: dataGridRow.id);

            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == "edit" ||
            dataGridCell.columnName == "delete") {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            alignment: Alignment.center,
            child: dataGridCell.value,
          );
        }
        return Container(
          // color: Colors.amber,
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: dataGridCell.columnName == 'rate'
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}
