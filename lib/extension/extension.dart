import 'package:http/http.dart';

extension ResponseExtension on Response {
  isSuccess() => statusCode > 200 || statusCode < 299;
}
