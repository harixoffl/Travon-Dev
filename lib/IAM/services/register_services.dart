import 'package:get/get.dart';
import 'package:travon/IAM/models/entities/IAM_entities.dart';

import '../../API/api.dart';
import '../../API/invoker.dart';
import '../../COMPONENTS-/Basic_DialogBox.dart';
import '../../COMPONENTS-/Response_entities.dart';
import '../controllers/IAM_actions.dart';

class RegisterServices {
  final IAMController IamController = Get.find<IAMController>();
  final RegisterController registerController = Get.find<RegisterController>();
  final Invoker apiController = Get.find<Invoker>();

  void Register(context) async {
    try {
      Register_Request requestData = Register_Request(
        name: registerController.registerModel.nameController.value.text,
        emailid: registerController.registerModel.emailController.value.text,
        phoneno: registerController.registerModel.phoneController.value.text,
        password: registerController.registerModel.passwordController.value.text,
      );

      Map<String, dynamic>? response = await apiController.IAM(requestData.toJson(), API.signupURL);

      if (response?['statusCode'] == 200) {
        CMResponse data = CMResponse.fromJson(response!);
        if (data.code) {
          registerController.toggleIndicator(false);
          await Success_dialog(
            context: context,
            // showCancel: false,
            title: 'Please click the link to verify on your Mail',
            content: data.message ?? "",
            onOk: () {
              registerController.registerModel.nameController.value.clear();
              registerController.registerModel.emailController.value.clear();
              registerController.registerModel.phoneController.value.clear();
              registerController.registerModel.passwordController.value.clear();
              registerController.registerModel.confirmController.value.clear();
            },
          );

          IamController.IAMModel.pagename.value = "Login";
        } else {
          registerController.toggleIndicator(false);
          await Error_dialog(context: context, title: 'Register Failed', content: data.message ?? "", onOk: () {});
        }
      } else {
        registerController.toggleIndicator(false);
        Error_dialog(context: context, title: "SERVER DOWN", content: "Please contact administration!");
      }
    } catch (e) {
      registerController.toggleIndicator(false);
      Error_dialog(context: context, title: "ERROR", content: "$e");
    }
  }
}
