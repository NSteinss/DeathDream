import 'package:death_dream/src/models/user.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});
  HomeController() {
    print('USUARIO DE SESION: ${user.toJson()}');
  }
}
