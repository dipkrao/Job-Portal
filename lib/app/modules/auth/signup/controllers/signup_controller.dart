import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/request/auth_request.dart';
import 'package:starter/app/data/repository/user_repository.dart';
import 'package:starter/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final UserRepository _repository = Get.find<UserRepository>();
  //TODO: Implement SignupController

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final skillsController = TextEditingController();
  final RxBool _isRecruiter = false.obs;
  bool get isRecruiter => _isRecruiter.value;

  void chooseRecruiter(bool isRecruiterSelected) {
    _isRecruiter.value = isRecruiterSelected;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  signUpUser() async {
    // LoadingUtils.showLoader();
    RepoResponse response = await _repository.signUp(SignUpRequest(
        userRole: isRecruiter ? 0 : 1,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
        skills: skillsController.text.trim()));
    // LoadingUtils.hideLoader();

    if (response.data.code == 201) {
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      // mobileWrapper.errorText = response.error?.message ?? "";
    }
  }

  void increment() => count.value++;
}
