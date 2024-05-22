import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/utils/constants/app_constants.dart';
import 'package:nexteons_internship_task/utils/constants/route_names.dart';

class LoginControler extends GetxController {
  Dio dio = Dio(BaseOptions(
    baseUrl: "https://api.realestate.salonsyncs.com/graphql",
    headers: {
      "X-Tenant-Id": "RL0582",
    },
  ));

  void onLogin() {
    GoRouter.of(navigatorKey.currentContext!).goNamed(RouteNames.homePage);
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> payload) async {
    try {
      final response =
          await dio.post('/graphql', data: payload, options: Options());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      throw Exception(
          'Dio error: ${e.response?.statusCode} - ${e.response?.statusMessage}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
