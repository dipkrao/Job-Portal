class LoginRequest {
  String? email;
  String? password;

  LoginRequest({this.email, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class SignUpRequest {
  int? userRole;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? skills;

  SignUpRequest({
    this.userRole,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.skills,
  });

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    userRole = json['userRole'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    skills = json['skills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userRole'] = this.userRole;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['skills'] = this.skills;
    return data;
  }
}
