import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/interceptor.dart';
import '../utils/shared-preferences.dart';

class UserService {
  // static String api = 'http://127.0.0.1:1337/api/v1/'; -ios emulator
  // static String api = 'http://10.0.2.2:1337/api/v1/'; -android emulator
  // static String api = 'http://192.168.1.129:1337/api/v1/'; -simulator
  static const String flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'DEVELOPMENT',
  );

  static const bool isProduction = flavor == 'PRODUCTION';

  // static String api =
  //     isProduction
  //         ? 'https://apexonline.lk/api/v1/user/'
  //         : 'http://127.0.0.1:1337/api/v1/user/';

  static String api = 'http://10.0.2.2:8080/api/v1/';

  static Map<String, String> header = {"Content-Type": "application/json"};

  final InterceptedHttpClient _client = InterceptedHttpClient();

  Future<Map<String, String>> getAuthenicationHeader() async {
    final token = await SharedPreferencesService.getToken();
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  static Future<http.Response> login(Map<String, dynamic> obj) {
    return http
        .post(
          Uri.parse('${api}auth/authenticate'),
          body: jsonEncode(obj),
          headers: header,
        )
        .timeout(Duration(seconds: 100));
  }

  static Future<http.Response> register(Map<String, dynamic> obj) {
    return http.post(
      Uri.parse('${api}register'),
      body: jsonEncode(obj),
      headers: header,
    );
  }

  static Future<http.Response> confirmOtp(Map<String, dynamic> obj) {
    return http.post(
      Uri.parse('${api}confirm-otp'),
      body: jsonEncode(obj),
      headers: header,
    );
  }

  Future<http.Response> getUser(int id) async {
    final authenicationHeader = await getAuthenicationHeader();
    return _client.get(
      Uri.parse('${api}get-user/?id=$id'),
      headers: authenicationHeader,
    );
  }
}
