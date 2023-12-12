import 'package:http/http.dart';
import 'package:sample/api/api.dart';

abstract class BaseHTTP {
  Future<dynamic> sendRequest(HttpType httpType, String endpotin,
      {Map<String, dynamic>? body}) async {
    //do similarly for other methods
    switch (httpType) {
      case HttpType.get:
        return await get(Uri.parse(Api.api + endpotin));
      case HttpType.delete:
      case HttpType.post:
    }
  }
}

enum HttpType {
  get,
  post,
  delete,
}
