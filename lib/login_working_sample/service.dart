import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  late Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.realestate.salonsyncs.com/graphql',
      headers: {
        'X-Tenant-Id': 'RL0582',
      },
    ));
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> payload) async {
    try {
      final response = await _dio.post('/graphql', data: payload);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error: ${e.response?.data}');
        throw Exception('Dio error: ${e.response?.statusCode} - ${e.response?.statusMessage}');
      } else {
        print('Dio error: ${e.message}');
        throw Exception('Dio error: ${e.message}');
      }
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Unexpected error: $e');
    }
  }
}
