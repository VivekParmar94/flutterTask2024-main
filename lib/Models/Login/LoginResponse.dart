class LoginResponse {
  bool? status;
  String? message;
  String? token;
  User? user;

  LoginResponse({this.status, this.message, this.token, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  int? isChangePassword;
  String? otp;
  Null profile;
  Roles? roles;
  List<String>? permissions;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.isChangePassword,
      this.otp,
      this.profile,
      this.roles,
      this.permissions});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    isChangePassword = json['is_change_password'];
    otp = json['otp'];
    profile = json['profile'];
    roles = json['roles'] != null ? new Roles.fromJson(json['roles']) : null;
    permissions = json['permissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['is_change_password'] = this.isChangePassword;
    data['otp'] = this.otp;
    data['profile'] = this.profile;
    if (this.roles != null) {
      data['roles'] = this.roles!.toJson();
    }
    data['permissions'] = this.permissions;
    return data;
  }
}

class Roles {
  String? id;
  String? name;
  String? guardName;
  int? status;
  String? discount;

  Roles({this.id, this.name, this.guardName, this.status, this.discount});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    status = json['status'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['status'] = this.status;
    data['discount'] = this.discount;
    return data;
  }
}
