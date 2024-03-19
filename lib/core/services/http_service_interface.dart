abstract class HttpServiceInterface {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, body);
  Future<dynamic> update(String url, dynamic data);
  Future<dynamic> delete(String url);
}
