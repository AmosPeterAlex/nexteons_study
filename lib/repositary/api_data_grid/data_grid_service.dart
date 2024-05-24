
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/model/api_data_grid_model.dart';


class DataGridService extends GetxService {
  Dio dio = Dio();
  // late Dio dio;
  @override
  void onInit() {
    super.onInit();
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.realestate.salonsyncs.com/graphql",
        headers: {
          'X-Tenant-Id': 'RL0582',
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjY2MzFkYTVkZTllZmEwYmQ4NGE4NjhmMiIsIl9mb3JjZUxvZ291dF8iOi0xLCJfZGV2aWNlX2lkXyI6IjY2NGRiYWIyMTE1NWUyYzc3MmFlOTJhMyIsIl91c2VyVHlwZV8iOjAsIl9jcml0aWNhbEVkaXRDb3VudF8iOi0xLCJpYXQiOjE3MTY1NTA5NDksImV4cCI6MTcxNzQxNDk0OSwiYXVkIjoiNjYzMWRhNWRlOWVmYTBiZDg0YTg2OGYyIiwiaXNzIjoiTmV4dGVvbnMuY29tIn0.gKA9jfVnILadEAp7b12Y-oIxQEwzCpSfp1nCytT3bOQ"
        },
      ),
    );
  }
 Future<Map<String, dynamic>> gridFetch(Map<String, dynamic> payload) async {
    try {
      final response = await dio.post("/graphql", data: payload);
      // log("-> Status code${response.statusCode} Data->${response.data}->${response.statusMessage}");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed in 1st exception ->${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // log("on catch if--->${e.response?.data}");
        throw Exception(
            "Error in on catch -> Status code${e.response?.statusCode} Data->${e.response?.data}->${e.response?.statusMessage}");
      } else {
        // log("on catch else->${e.response?.data}--< -->${e.message}");
        throw Exception("dio error ->${e.message}");
      }
    } catch (e) {
      throw Exception("Catch error $e");
    }
  }

  //old service class
  // Future<ApiDataGridModel> fetchData() async {
  
  //   final response = await dio.post("/graphql", data: payload);
  //   // final response = await _dio.post(
  //   //   'https://api.realestate.salonsyncs.com/graphql',
  //   //   data: {'query': query},
  //   // );

  //   if (response.statusCode == 200) {
  //     return ApiDataGridModel.fromJson(response.data);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

}

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