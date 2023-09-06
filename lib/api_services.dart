import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        'https://dummy-api.com/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login');
    }
  }
}

// class ApiService {
//   final Dio _dio = Dio();

//   Future<Map<String, dynamic>> login(String email, String password) async {
//     // Simulate an API call
//     await Future.delayed(const Duration(seconds: 2));

//     // Simulated API response
//     final dummyApiResponse = {
//       'success': true,
//       'message': 'Login successful!',
//       'user': {
//         'name': 'John Doe',
//         'email': email,
//       },
//     };

//     return dummyApiResponse;
//   }
// }
