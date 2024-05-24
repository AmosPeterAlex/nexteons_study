

import 'dart:developer';

import 'package:get/get.dart';
import 'package:nexteons_internship_task/repositary/api_data_grid/data_grid_service.dart';

class ApiDataGridController extends GetxController {
  final DataGridService service = Get.put(DataGridService());
  Future<void> onApiGridDataGet() async {
    Map<String, dynamic> payload = {
      "query": '''
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
      final response = await service.gridFetch(payload);
      // log("response in controller ----> $response");
      // log("access token ->${response['data']['Auth_Login']}");
      if (response != null && response["data"] != null ) {
        // accessToken = response['data']['Auth_Login']['accessToken'];
        // print("access token. value--->>>>>${accessToken}");
        log("response[data] in controller log--> ${response["data"]["DpiRate_List"]} ");
        // var token= response['data']['Auth_Login']['accessToken'];
        // storeReceivedData(accessToken);
        // GoRouter.of(navigatorKey.currentContext!).goNamed(RouteNames.listPage);
      } else {
        // print('Error: Auth_Login key not found in response');
      }
    } catch (e) {
      // log("e---> $e");
    }
  }
}
