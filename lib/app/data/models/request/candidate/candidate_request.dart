// All jobs
class AllJobsModel {
  List<AllJobsData>? data;
  int? code;
  bool? success;
  Metadata? metadata;

  AllJobsModel({this.data, this.code, this.success, this.metadata});

  AllJobsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AllJobsData>[];
      json['data'].forEach((v) {
        data!.add(new AllJobsData.fromJson(v));
      });
    }
    code = json['code'];
    success = json['success'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    data['success'] = this.success;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    return data;
  }
}

class AllJobsData {
  String? title;
  String? description;
  String? location;
  String? createdAt;
  String? updatedAt;
  String? id;

  AllJobsData(
      {this.title,
      this.description,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.id});

  AllJobsData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['location'] = this.location;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}

class Metadata {
  int? count;
  String? limit;

  Metadata({this.count, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['limit'] = this.limit;
    return data;
  }
}

// one job candidate

class OneJobCandidateModel {
  List<OneJobCandidateData>? data;
  int? code;
  bool? success;

  OneJobCandidateModel({this.data, this.code, this.success});

  OneJobCandidateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OneJobCandidateData>[];
      json['data'].forEach((v) {
        data!.add(new OneJobCandidateData.fromJson(v));
      });
    }
    code = json['code'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    data['success'] = this.success;
    return data;
  }
}

class OneJobCandidateData {
  String? email;
  String? name;
  String? skills;
  String? id;

  OneJobCandidateData({this.email, this.name, this.skills, this.id});

  OneJobCandidateData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    skills = json['skills'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['skills'] = this.skills;
    data['id'] = this.id;
    return data;
  }
}
