import 'dart:developer';

import 'package:dio/dio.dart';

class DataGridService {
  Dio dio = Dio();
  static Future<dynamic> fetchData(
      {required Map<String, String> header,
      required Map<String, dynamic> data}) async {
    const url = "https://api.realestate.salonsyncs.com/graphql";

    try {
      var response =
          await Dio().post(url, options: Options(headers: header), data: data);
      if (response.statusCode == 200) {
        var decodedData = response.data;
        log("--> in service${response.statusCode}");
        return decodedData;
      } else {
        log("else ${response.statusCode}");
        return response.data;
      }
    } catch (e) {
      log("e---->$e");
      rethrow;
    }
  }
}

// class DataGridService extends GetxService {
//   Dio dio = Dio();

//   Future<String?> getToken() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String? tokenJson = sharedPreferences.getString("LOGIN");
//     if (tokenJson != null) {
//       var accessToken = json.decode(tokenJson);
//       return accessToken;
//     }
//     return null;
//   }

//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     String? accessToken = await getToken();
//     dio = Dio(
//       BaseOptions(
//         baseUrl: "https://api.realestate.salonsyncs.com/graphql",
//         headers: {
//           'X-Tenant-Id': 'RL0582',
//           "Authorization": "Bearer $accessToken"
//           // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjY2MzFkYTVkZTllZmEwYmQ4NGE4NjhmMiIsIl9mb3JjZUxvZ291dF8iOi0xLCJfZGV2aWNlX2lkXyI6IjY2NGRiYWIyMTE1NWUyYzc3MmFlOTJhMyIsIl91c2VyVHlwZV8iOjAsIl9jcml0aWNhbEVkaXRDb3VudF8iOi0xLCJpYXQiOjE3MTY1NTA5NDksImV4cCI6MTcxNzQxNDk0OSwiYXVkIjoiNjYzMWRhNWRlOWVmYTBiZDg0YTg2OGYyIiwiaXNzIjoiTmV4dGVvbnMuY29tIn0.gKA9jfVnILadEAp7b12Y-oIxQEwzCpSfp1nCytT3bOQ"
//         },
//       ),
//     );
//   }

//   Future<Map<String, dynamic>> gridFetch(Map<String, dynamic> payload) async {
//     try {
//       final response = await dio.post("/graphql", data: payload);
//       // log("-> Status code${response.statusCode} Data->${response.data}->${response.statusMessage}");
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception("Failed in 1st exception ->${response.statusCode}");
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         // log("on catch if--->${e.response?.data}");
//         print("DioError Response Data: ${e.response?.data}");
//         print("DioError Response Status Code: ${e.response?.statusCode}");
//         print("DioError Response Status Message: ${e.response?.statusMessage}");
//         throw Exception(
//             "Error in on catch -> Status code${e.response?.statusCode} Data->${e.response?.data}->${e.response?.statusMessage}");
//       } else {
//         // log("on catch else->${e.response?.data}--< -->${e.message}");
//         throw Exception("dio error ->${e.message}");
//       }
//     } catch (e) {
//       throw Exception("Catch error $e");
//     }
//   }

  