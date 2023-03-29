// Login Model
class LoginRequest {
  LoginData? data;
  int? code;
  bool? success;

  LoginRequest({this.data, this.code, this.success});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
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

class LoginData {
  String? email;
  String? name;
  String? skills;
  int? userRole;
  String? createdAt;
  String? updatedAt;
  String? id;
  String? token;

  LoginData(
      {this.email,
      this.name,
      this.skills,
      this.userRole,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
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

// SignUp Model
class SignUpRequest {
  SignUpData? data;
  int? code;
  bool? success;

  SignUpRequest({this.data, this.code, this.success});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new SignUpData.fromJson(json['data']) : null;
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

class SignUpData {
  String? id;
  String? email;
  int? userRole;
  String? name;
  String? skills;
  String? updatedAt;
  String? createdAt;
  String? token;

  SignUpData(
      {this.id,
      this.email,
      this.userRole,
      this.name,
      this.skills,
      this.updatedAt,
      this.createdAt,
      this.token});

  SignUpData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    userRole = json['userRole'];
    name = json['name'];
    skills = json['skills'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['userRole'] = this.userRole;
    data['name'] = this.name;
    data['skills'] = this.skills;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    data['token'] = this.token;
    return data;
  }
}
