import 'package:dio/dio.dart';
import 'package:instagram/modals/usermodal.dart';

class Services {
  static Future<Users> fonksiyon() async {
    Dio dio = Dio();

    final response = await dio.get('https://reqres.in/api/users?page=2');
    return Users.fromJson(response.data);
  }
}
