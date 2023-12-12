import 'dart:convert';

import 'package:http/http.dart';
import 'package:sample/extension/extendsion.dart';
import 'package:sample/models/user_model.dart';
import 'package:sample/repositories/base_http.dart';

class UserRepository extends BaseHTTP {
  Future<List<UserModel>> getUsers() async {
    Response response = await sendRequest(HttpType.get, "users?page=2");
    if (response.isSuccess()) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
