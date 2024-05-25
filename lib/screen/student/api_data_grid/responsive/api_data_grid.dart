import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/model/api_data_grid_model.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/controller/api_data_grid_controller.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/controller/api_data_grid_source.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../widgets/create_floating_nav_button.dart';

class ApiDataGridMac extends StatelessWidget {
  final ApiDataGridController controller;
  ApiDataGridMac({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          final apiDataGridSource = ApiDataGridSource(controller.dpiRateList);
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.dpiRateList.isEmpty) {
            return Center(child: Text('NO DATA'));
          }

          return SfDataGrid(
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            source: apiDataGridSource,
            columns: [
              GridColumn(
                columnName: 'id',
                label: Container(
                  color: ColorConstants.textFieldFillColor,
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
                  color: ColorConstants.textFieldFillColor,
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
                  color: ColorConstants.textFieldFillColor,
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
        },
      ),
      floatingActionButton: CreateFloatingNavigationButton(
          position: CreateFloatingButtonPosition(bottom: 5, right: 20),
          onPressed: () {
            print("_____");
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: Text("Add Data")),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      // controller: ,
                      decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      // controller: ,
                      decoration: InputDecoration(
                          hintText: "Rate",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ],
                ),
                actions: [
                  MaterialButton(
                    shape: StadiumBorder(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                    color: ColorConstants.cardFillColor,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  MaterialButton(
                    shape: StadiumBorder(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("ADD"),
                    color: ColorConstants.loginButtonColor,
                  )
                ],
              ),
            );
            // showAboutDialog(context: context);
          },
          buttonText: "Create"),
    );
  }
}
