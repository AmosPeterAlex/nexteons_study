import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/model/api_data_grid_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ApiDataGridSource extends DataGridSource {
  List<DataGridRow> dataGridRows = [];

  ApiDataGridSource(List<ListElement> dpiRateList) {
    dataGridRows = dpiRateList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: dataGridRow.id),
        DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
        DataGridCell<int>(columnName: 'rate', value: dataGridRow.rate),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          // color: Colors.amber,
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: dataGridCell.columnName == 'rate' ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}