import 'package:get/get.dart';
import 'package:travon/home/models/constants/home_constants.dart';

class HomeController extends GetxController {
  var HomeModel = Homemodel();

  void updateUsernameController(String value) {
    HomeModel.pagename.value = value;
  }

  void update_fromQuery(String value) {
    HomeModel.from_query.value = value;
  }

  void update_toQuery(String value) {
    HomeModel.to_query.value = value;
  }
}
