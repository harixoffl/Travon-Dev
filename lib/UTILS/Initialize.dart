import 'package:get/get.dart';
import 'package:travon/API/invoker.dart';
import 'package:travon/IAM/controllers/IAM_actions.dart';
import 'package:travon/home/controllers/home_actions.dart';

void initialize_IAM() {
  Get.lazyPut<IAMController>(() => IAMController());
  Get.lazyPut<SessiontokenController>(() => SessiontokenController());
  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<RegisterController>(() => RegisterController());
  Get.lazyPut<ForgotpasswordController>(() => ForgotpasswordController());
  Get.lazyPut<NewpasswordController>(() => NewpasswordController());
  Get.lazyPut<Invoker>(() => Invoker());
  Get.lazyPut<VerifyOTPControllers>(() => VerifyOTPControllers());
}

void initialize_others() {
  Get.lazyPut<HomeController>(() => HomeController());
}
