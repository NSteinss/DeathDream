import 'package:death_dream/src/environments/environments.dart';
import 'package:death_dream/src/models/response_api.dart';
import 'package:death_dream/src/models/user.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class UsersProvider extends GetConnect {
  String url = '${Enviroment.API_URL}api/users';
  Future<Response> create(User user) async {
    Response response = await post('$url/create', user.toJson(),
        headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post(
        '$url/login', {'email': email, 'password': password},
        headers: {'Content-Type': 'application/json'});
    if (response.body == null) {
      Get.snackbar('Error', 'No fue posible realizar la petición');
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}
