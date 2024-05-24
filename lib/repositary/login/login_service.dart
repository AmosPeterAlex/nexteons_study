// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginService extends GetxService {
  late Dio dio;

  @override
  void onInit() {
    super.onInit();
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.realestate.salonsyncs.com/graphql",
        headers: {
          'X-Tenant-Id': 'RL0582',
        },
      ),
    );
  }

  Future<Map<String, dynamic>> logService(Map<String, dynamic> payload) async {
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
}
