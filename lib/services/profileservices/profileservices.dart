// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:slms/model/profilemodel/profilemodel.dart';

// class ProfileServices {
//   Dio dio = Dio();
//   var token =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQ0Nzc0OWE2MmI2MGQyZDlkMzYwZWUiLCJpYXQiOjE3Mzk3NjQ3MzAsImV4cCI6MTczOTc2ODMzMH0.Bp9PBeUuekCWwypMu6QpAz84W5y19wydJUq-G7I2_0Q';
//   final profileBaseUrl =
//       'https://www.lms-api.bridgeon.in/api/admin/students/profile/66447749a62b60d2d9d360ee';
//   Future<List<StudentModel>> getAllProfileDatas() async {
//     try {
//       Options options = Options(
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );

//       final response = await dio.get(profileBaseUrl, options: options);

//       if (response.statusCode == 200) {
//         log(response.data.toString());

//         List<dynamic> data = response.data['data'];
//         log(response.data['messege']);
//         log(data.toString());
//         return data.map((e) => StudentModel.fromJson(e)).toList();
//       } else {
//         log('Failed to fetch data Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       if (e is DioException) {
//         log('Error occurred: ${e.message} ${e.response?.data}');
//       } else {
//         log('An unexpected error occurred: $e');
//       }
//       throw Exception('Failed to load profile data');
//     }

//     return [];
//   }
// }

// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:slms/model/profilemodel/profilemodel.dart';

// class ProfileServices {
//   Dio dio = Dio();
//   final String token = 'your_token_here';
//   final String profileBaseUrl =
//       'https://www.lms-api.bridgeon.in/api/admin/students/profile/66447749a62b60d2d9d360ee';

//   Future<List<StudentModel>> getAllProfileDatas() async {
//     try {
//       Options options = Options(
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );

//       final response = await dio.get(profileBaseUrl, options: options);

//       if (response.statusCode == 200) {
//         log("Response received: ${response.data}");

//         if (response.data == null || response.data['data'] == null) {
//           log("API returned null or unexpected response structure.");
//           return [];
//         }

//         if (response.data['data'] is List) {
//           List<dynamic> data = response.data['data'];

//           if (data.isEmpty) {
//             log("No profile data available.");
//             return [];
//           }

//           return data.map((e) => StudentModel.fromJson(e)).toList();
//         } else {
//           log("Unexpected data format received: ${response.data}");
//           return [];
//         }
//       } else {
//         log('Failed to fetch data, Status code: ${response.statusCode}, Message: ${response.statusMessage}');
//         return [];
//       }
//     } catch (e) {
//       if (e is DioException) {
//         log('Dio error: ${e.message}, Response: ${e.response?.data}');
//       } else {
//         log('Unexpected error occurred: $e');
//       }
//       return [];
//     }
//   }
// }

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:slms/model/profilemodel/profilemodel.dart';

class ProfileServices {
  final Dio dio = Dio();
  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQ0Nzc0OWE2MmI2MGQyZDlkMzYwZWUiLCJpYXQiOjE3Mzk3NjQ3MzAsImV4cCI6MTczOTc2ODMzMH0.Bp9PBeUuekCWwypMu6QpAz84W5y19wydJUq-G7I2_0Q';
  final String profileBaseUrl =
      'https://www.lms-api.bridgeon.in/api/admin/students/profile/66447749a62b60d2d9d360ee';

  Future<List<StudentModel>> getAllProfileDatas() async {
    try {
      final response = await dio.get(
        profileBaseUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        log('Response received: ${response.data}');

        // Ensure the response contains the expected data structure
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey('data')) {
          final List<dynamic> data = response.data['data'];

          if (data.isEmpty) {
            log('No profile data found.');
            return [];
          }

          return data.map((e) => StudentModel.fromJson(e)).toList();
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        log('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Failed to load profile data');
      }
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      if (e.response != null) {
        log('Response data: ${e.response?.data}');
      }
      throw Exception('Failed to load profile data: ${e.message}');
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception('An error occurred while fetching profile data');
    }
  }
}
