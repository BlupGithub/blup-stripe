import 'package:meta/meta.dart';

import '../../messages.dart';
import '../client.dart';

abstract class Resource<T extends Message> {
  @protected
  final Client _client;

  Resource(this._client);

  @protected
  @visibleForOverriding
  String makeUrl(String path) {
    return path;
  }

  @protected
  Future<Map<String, dynamic>> get(final String path,
          {Map<String, dynamic>? queryParameters}) {
   print(">>>> ${makeUrl(path)} $queryParameters");
    return
      _client.get(makeUrl(path), queryParameters: queryParameters);
  }
  @protected
  Future<Map<String, dynamic>> post(final String path,
          {final Map<String, dynamic>? data}) {
    print("update path>> ${makeUrl(path)} and data> $data");
    return _client.post(makeUrl(path), data: data);
  }

  @protected
  Future<Map<String, dynamic>> delete(final String path,
  {final Map<String, dynamic>? queryParameters}) {
    print("delete>>>> ${makeUrl(path)} $queryParameters");
    return _client.delete(makeUrl(path), queryParameters: queryParameters);
  }
}
