import 'package:http/http.dart' as http;
import 'shared-preferences.dart';

class InterceptedHttpClient extends http.BaseClient {
  final http.Client _client = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final response = await _client.send(request);
    if (response.statusCode == 401) {
      await SharedPreferencesService.clearAll();
    }
    return response;
  }
}
