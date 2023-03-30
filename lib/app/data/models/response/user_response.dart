import 'package:starter/app/data/models/dto/user.dart';

class UserResponse {
  late UserModel? data;
  late int code;

  UserResponse({required this.data, required this.code});

  UserResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] == null ? null : UserModel.fromJson(json['data']);
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data?.toJson();
    data['code'] = code;
    return data;
  }
}
