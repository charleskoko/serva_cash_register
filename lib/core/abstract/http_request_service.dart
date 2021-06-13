abstract class HttpRequestService {
  Future<Map<String, dynamic>> get(String url);
  Future<Map<String, dynamic>> post(String url, {Map<String, dynamic> data});
  Future<Map<String, dynamic>> patch(String url, {Map<String, dynamic> data});
  Future<Map<String, dynamic>> delete(String url, {Map<String, dynamic> data});
}
