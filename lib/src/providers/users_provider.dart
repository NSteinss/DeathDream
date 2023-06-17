import 'package:death_dream/src/environments/environments.dart';
import 'package:death_dream/src/models/user.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class UsersProvider extends GetConnect {
  String url = '${Enviroment.API_URL}api/users';
  Future<Response> create(User user) async {
    Response response = await post(
      '$url/create', 
      user.toJson(),
      headers: {'Content-Type': 'application/json'}
    );
    return response;
  }
}
