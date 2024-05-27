import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/model/api_data_grid_model.dart';
import 'package:nexteons_internship_task/repositary/api_data_grid/data_grid_service.dart';
import 'package:nexteons_internship_task/utils/constants/app_constants.dart';
import 'package:nexteons_internship_task/utils/payload/api_body.dart';
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
      // print("999999999999999999999999 $headers");
      log("failed to get header");
      return;
    }
    

var payload= Payload.loginPayload;
    try {
      // print("88888888888888888$headers");
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
          // log("No data found in response: ${response['data']["DpiRate_List"]["list"]}");
        }
      } else {
        // log("Unexpected response structure: $response");
      }
    } catch (e) {
      // log("Error fetching data: $e");
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
        "Authorization": "Bearer $token"
      };
      // log("$token");
    } else {
      log(" ---token not geting from shared prefernce---");
      return {};
    }
  }

  editData({String? id}) async {
    log("message");
    Map<String, String> headers = await getApiHeader();
    if (headers.isEmpty) {
      log("failed to get api header");
    }
    Map<String, dynamic> payload = {
      'query': '''
mutation DPI_Rate_Update(\$updateDpiRateInput: UpdateDpiRateInput!) {
  DPI_Rate_Update(updateDpiRateInput: \$updateDpiRateInput) {
    _id
  }
}
''',
      'variables': {
        "updateDpiRateInput": {
          "_branchId": "6631da5ce9efa0bd84a86852",
          "_editCount": -1,
          "_id": id,
          "_name": nameController.text,
          "_rate": int.tryParse(rateController.text)
        }
      },
    };
    try {
      var responsebody =
          await DataGridService.fetchData(header: headers, data: payload);
      log("{$responsebody['data}");
      if (responsebody["data"] != null) {
        log("----->>>iff{$responsebody['data}");
        // AppSnackbar.oneTimeSnackBar("Success",
        //     context: navigatorKey.currentContext!, bgColor: Colors.green);
        await getData();
        nameController.clear();
        rateController.clear();
      } else {
        log("elsseee{$responsebody['data}");
        // AppSnackbar.oneTimeSnackBar("Failed to Fetch Data",
        //     context: navigatorKey.currentContext!, bgColor: Colors.red);
      }
      nameController.clear();
      rateController.clear();
      Navigator.of(navigatorKey.currentContext!).pop();
    } catch (e) {
      log("An error occurred: $e");
    }
  }
  void delete({String? id}) async {

    isLoading = true.obs;
    Map<String, String> headers = await getApiHeader();
    if (headers.isEmpty) {
      var message = "Failed to get API headers";
      log(message);
      return;
    }

    Map<String, dynamic> payload = {
      'query': '''
mutation DPI_Rate_StatusChange(\$statusChange: StatusChangeInput!) {
  DPI_Rate_StatusChange(statusChange: \$statusChange) {
    message
}
}
''',
      'variables': {
        "statusChange": {
          "_editCount": -1,
          "_logDescription": null,
          "_status": "DELETE",
          "ids": id
        }
      }
    };

    try {
      var responsebody =
      await DataGridService.fetchData(header: headers, data: payload);
      if (responsebody["data"] != null) {
        await getData();
      } else {

      }
      isLoading = false.obs;
    } catch (e) {
      log("An error occurred: $e");
    }
  }
}
