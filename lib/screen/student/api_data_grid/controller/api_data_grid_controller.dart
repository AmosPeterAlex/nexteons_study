import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/model/api_data_grid_model.dart';
import 'package:nexteons_internship_task/repositary/api_data_grid/data_grid_service.dart';
import 'package:nexteons_internship_task/utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiDataGridController extends GetxController {
  late SharedPreferences sharedPreferences;
  var nameController = TextEditingController();
  var rateController = TextEditingController();
  var dpiRateList = <ListElement>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getData() async {
    isLoading = true.obs;
    Map<String, String> headers = await getApiHeader();
    if (headers.isEmpty) {
      log("failed to get header");
      return;
    }
    Map<String, dynamic> payload = {
      'query': '''
        query List(\$filterOptions: ListDpiInput!) {
          DpiRate_List(FilterOptions: \$filterOptions) {
            list {
              _name
              _rate
              _id
            }
            totalCount
          }
        }
      ''',
      'variables': {
        "filterOptions": {
          "branchIds": "6631da5ce9efa0bd84a86852",
          "limit": -1,
          "skip": 0,
          "statusArray": [1]
        }
      }
    };

    try {
      var response =
          await DataGridService.fetchData(header: headers, data: payload);
      if (response["data"] != null) {
        // if (response != null && response["data"] != null && response["data"]["DpiRate_List"] != null) {
        var listData = response["data"]["DpiRate_List"]["list"];

        if (listData != null) {
          log(listData.toString());
          //fuyfiyckj
          ApiDataGridModel apiDataGridModel =
              ApiDataGridModel.fromJson(response);
          dpiRateList.value = apiDataGridModel.data?.dpiRateList?.list ?? [];
          /*
          Receive a JSON response from an API call.
          Convert this JSON response into a Dart object of type ApiDataGridModel.
          Store this object in the apiDataGridModel variable for further use in your application,
          such as displaying data in the UI or performing additional logic
           */
          /*
          updates the dpiRateList with a list from the API response, ensuring that the value is always a valid list, even if the response data contains null values at various levels.
           */
        } else {
          log("No data found in response: ${response['data']["DpiRate_List"]["list"]}");
        }
      } else {
        log("Unexpected response structure: $response");
      }
    } catch (e) {
      log("Error fetching data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  ///adding data
  Future<void> addData() async {
    log("------>>>>");
    isLoading = true.obs;
    Map<String, String> headers = await getApiHeader();
    if (headers.isEmpty) {
      log("failed to get api");
      return;
    }
    Map<String, dynamic> payload = {
      'query': '''
mutation DPI_Rate_Create(\$createDpiRateInput: CreateDpiRateInput!) {
  DPI_Rate_Create(createDpiRateInput: \$createDpiRateInput) {
    _id
  }
}
''',
      'variables': {
        "createDpiRateInput": {
          "_branchId": '6631da5ce9efa0bd84a86852',
          "_name": nameController.text,
          "_rate": int.parse(rateController.text)
        }
      },
    };
    try {
      var response =
          await DataGridService.fetchData(header: headers, data: payload);
      if (response['data'] != null) {
        await getData();
        Navigator.pop(navigatorKey.currentContext!);
      } else {
        print("elseeee");
      }
      nameController.clear();
      rateController.clear();
    } catch (e) {
      log("{$e}");
    }
  }

  Future<Map<String, String>> getApiHeader() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("LOGIN");
    if (token != null) {
      return {
        "X-Tenant-Id": "RL0582",
        "Authorization": "Bearer ${json.decode(token)}"
      };
      log("$token");
    } else {
      log(" ---token not geting from shared prefernce---");
      return {};
    }
  }
}
