import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/user.dart';
import 'package:starter/app/data/models/request/auth_request.dart';
import 'package:starter/app/data/models/request/candidate/candidate_request.dart';
import 'package:starter/app/data/models/response/user_response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/core/base/base_reposiotry.dart';

import '../../../core/helper/exception_handler.dart';

class UserRepository extends BaseRepositry {
  Future<RepoResponse<bool>> login(LoginRequest data) async {
    final response =
        await controller.post(path: URLs.login, data: data.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: true);
  }

  Future<RepoResponse<User>> signUp(SignUpRequest data) async {
    final response =
        await controller.post(path: URLs.signUp, data: data.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: UserResponse.fromJson(response).data);
  }

  Future<RepoResponse<List<AllJobsData>?>> getAllJobsData() async {
    final response = await controller.get(
      path: URLs.getAvailableJobs,
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: response.data);
  }
}
