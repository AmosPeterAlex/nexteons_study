import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/responsive_layout_builder.dart';
import 'package:nexteons_internship_task/screen/frame/frame_view.dart';
import 'package:nexteons_internship_task/screen/student/data_grid/responsive/mac_data_grid.dart';

class DataGridView extends StatelessWidget {

  const DataGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        macView: MacDataGrid(),
        iPhoneView: MacDataGrid(),
        iPadView: MacDataGrid());
  }
}
