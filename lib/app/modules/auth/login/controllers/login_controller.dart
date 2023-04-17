import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/request/auth_request.dart';
import 'package:starter/app/data/network/network_requester.dart';
import 'package:starter/app/data/repository/user_repository.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class LoginController extends GetxController {
  final UserRepository _repository = Get.find<UserRepository>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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

  loginUser() async {
    // LoadingUtils.showLoader();
    RepoResponse response = await _repository.login(LoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text.trim()));
    // LoadingUtils.hideLoader();

    if (response.data.code == 200) {
      Storage.setToken(response.data!.token!);
      NetworkRequester.authenticated.prepareAuthenticatedRequest();
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      // mobileWrapper.errorText = response.error?.message ?? "";
    }
  }

  void increment() => count.value++;
}
