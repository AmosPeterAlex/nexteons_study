import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:nexteons_internship_task/model/api_data_grid_model.dart';
import 'package:nexteons_internship_task/repositary/api_data_grid/data_grid_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiDataGridController extends GetxController {
  late SharedPreferences sharedPreferences;
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
    
      var response = await DataGridService.fetchData(header: headers, data: payload);

      if (response != null && response["data"] != null && response["data"]["DpiRate_List"] != null) {
        var listData = response["data"]["DpiRate_List"]["list"];
        
        if (listData != null) {
          log(listData.toString());
          ApiDataGridModel apiDataGridModel = ApiDataGridModel.fromJson(response);
          dpiRateList.value = apiDataGridModel.data?.dpiRateList?.list ?? [];
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

    // try {
    //   var response =
    //       await DataGridService.fetchData(header: headers, data: payload);
    //   if (response != null &&
    //       response["data"] != null &&
    //       response["data"]["DpiRate_List"] != null) {
    //     log("{$response['data']['DpiRate_List']['list]}");


    //     ApiDataGridModel apiDataGridModel = ApiDataGridModel.fromJson(response);
    //     //update with new
    //     dpiRateList.value = apiDataGridModel.data?.dpiRateList?.list ?? [];
    //     isLoading = false.obs;
    //   } else {
    //     print("${response['data']["DpiRate_List"]["list"]}");
    //     print("failed to fetch data");
    //   }
    // } catch (e) {
    //   print("log error $e");
    // }
  


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


// class ApiDataGridController extends GetxController {
//   final DataGridService service = Get.put(DataGridService());
   
//   var dpiRateList = <ListElement>[].obs;
//   RxBool isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     onApiGridDataGet();
//   }

//   Future<void> onApiGridDataGet() async {
//     Map<String, dynamic> payload = {
//       "query": '''
//        query List(\$filterOptions: ListDpiInput!) {
//   DpiRate_List(FilterOptions: \$filterOptions) {
//     list {
//       _name
//       _rate
//       _id
//     }
//     totalCount
//   }
// }

//       ''',
//       'variables': {
//         "filterOptions": {
//           "branchIds": "6631da5ce9efa0bd84a86852",
//           "limit": -1,
//           "skip": 0,
//           "statusArray": [1]
//         }
//       }
//     };

//     try {
//       // var resBody= await GetDpiRate
//       isLoading(true);
//       final response = await service.gridFetch(payload);
      
//       if (response != null && response["data"] != null) {
        
//         log("response['data']['DpiRate_List']['list'] in controller log--> ${response["data"]["DpiRate_List"]["list"]} ");
//         // ApiDataGridModel apiDataGridModel = ApiDataGridModel.fromJson(
//         // jsonDecode(response["data"]["DpiRate_List"]));
//         // apiDataGridModel.value = apiDataGridModel.data?.dpiRateList?.list ?? [];
//         ApiDataGridModel apiDataGridModel = ApiDataGridModel.fromJson(response);
//         // dpiRateList.value = apiDataGridModel.data?.dpiRateList?.list ?? [];
//         log("_______>>>>>>>>>${response["data"]["DpiRate_List"]["list"]}");
//         dpiRateList.addAll(apiDataGridModel.data?.dpiRateList?.list ?? []);
//       } else {
//         print('_________found in response');
//       }
//     } catch (e) {
//       log("e------> $e");
//     }finally{
//       isLoading(false);
//     }
//   }
// }
