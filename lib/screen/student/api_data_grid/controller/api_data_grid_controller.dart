import 'dart:developer';

import 'package:get/get.dart';
import 'package:nexteons_internship_task/model/api_data_grid_model.dart';
import 'package:nexteons_internship_task/repositary/api_data_grid/data_grid_service.dart';

class ApiDataGridController extends GetxController {
  final DataGridService service = Get.put(DataGridService());
   
  var dpiRateList = <ListElement>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    onApiGridDataGet();
  }

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
      // var resBody= await GetDpiRate
      isLoading(true);
      final response = await service.gridFetch(payload);
      
      if (response != null && response["data"] != null) {
        
        log("response['data']['DpiRate_List']['list'] in controller log--> ${response["data"]["DpiRate_List"]["list"]} ");
        // ApiDataGridModel apiDataGridModel = ApiDataGridModel.fromJson(
        // jsonDecode(response["data"]["DpiRate_List"]));
        // apiDataGridModel.value = apiDataGridModel.data?.dpiRateList?.list ?? [];
        ApiDataGridModel apiDataGridModel = ApiDataGridModel.fromJson(response);
        // dpiRateList.value = apiDataGridModel.data?.dpiRateList?.list ?? [];
        log("_______>>>>>>>>>${response["data"]["DpiRate_List"]["list"]}");
        dpiRateList.addAll(apiDataGridModel.data?.dpiRateList?.list ?? []);
      } else {
        print('_________found in response');
      }
    } catch (e) {
      log("e------> $e");
    }finally{
      isLoading(false);
    }
  }
}
