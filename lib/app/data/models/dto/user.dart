class UserModel {
  Data? data;
  int? code;
  bool? success;

  UserModel({this.data, this.code, this.success});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? email;
  String? name;
  String? skills;
  int? userRole;
  String? createdAt;
  String? updatedAt;
  String? id;
  String? token;

  Data(
      {this.email,
      this.name,
      this.skills,
      this.userRole,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    skills = json['skills'];
    userRole = json['userRole'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['skills'] = this.skills;
    data['userRole'] = this.userRole;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    data['token'] = this.token;
    return data;
  }
}
