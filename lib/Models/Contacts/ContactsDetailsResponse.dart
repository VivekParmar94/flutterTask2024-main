class ContactsDetailsResponse {
  bool? status;
  String? message;
  Data? data;

  ContactsDetailsResponse({this.status, this.message, this.data});

  ContactsDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? companyId;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? profile;
  String? branchId;
  String? departmentId;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? otp;
  String? otpExpiry;
  int? isChangePassword;
  String? companyName;
  String? branchName;
  String? departmentName;
  List<ContactTypes>? contactTypes;
  List<Addresses>? addresses;
  String? company;

  Data(
      {this.id,
        this.companyId,
        this.firstName,
        this.lastName,
        this.mobile,
        this.email,
        this.profile,
        this.branchId,
        this.departmentId,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.otp,
        this.otpExpiry,
        this.isChangePassword,
        this.companyName,
        this.branchName,
        this.departmentName,
        this.contactTypes,
        this.addresses,
        this.company});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    // firstName = json['first_name'];
    firstName = json['first_name'] != null ? json['first_name'] : "-";

    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    profile = json['profile'];
    branchId = json['branch_id'];
    departmentId = json['department_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    otp = json['otp'];
    otpExpiry = json['otp_expiry'];
    isChangePassword = json['is_change_password'];
    companyName = json['company_name'];
    branchName = json['branch_name'];
    departmentName = json['department_name'];
    if (json['contact_types'] != null) {
      contactTypes = <ContactTypes>[];
      json['contact_types'].forEach((v) {
        contactTypes!.add(new ContactTypes.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    company: json['company'] ?? 'Unknown';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['profile'] = this.profile;
    data['branch_id'] = this.branchId;
    data['department_id'] = this.departmentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['otp'] = this.otp;
    data['otp_expiry'] = this.otpExpiry;
    data['is_change_password'] = this.isChangePassword;
    data['company_name'] = this.companyName;
    data['branch_name'] = this.branchName;
    data['department_name'] = this.departmentName;
    if (this.contactTypes != null) {
      data['contact_types'] =
          this.contactTypes!.map((v) => v.toJson()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    data['company'] = this.company;
    return data;
  }
}

class ContactTypes {
  String? contactTypeId;
  String? name;
  String? id;
  Pivot? pivot;

  ContactTypes({this.contactTypeId, this.name, this.id, this.pivot});

  ContactTypes.fromJson(Map<String, dynamic> json) {
    contactTypeId = json['contact_type_id'];
    name = json['name'];
    id = json['id'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_type_id'] = this.contactTypeId;
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? contactId;
  String? contactTypeId;
  String? createdAt;
  String? updatedAt;

  Pivot({this.contactId, this.contactTypeId, this.createdAt, this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    contactId = json['contact_id'];
    contactTypeId = json['contact_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_id'] = this.contactId;
    data['contact_type_id'] = this.contactTypeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Addresses {
  String? id;
  String? contactId;
  int? countryId;
  int? stateId;
  String? addressLine1;
  String? addressLine2;
  String? landmark;
  String? city;
  String? pincode;
  int? isDefault;
  String? countryName;
  String? stateName;

  Addresses(
      {this.id,
        this.contactId,
        this.countryId,
        this.stateId,
        this.addressLine1,
        this.addressLine2,
        this.landmark,
        this.city,
        this.pincode,
        this.isDefault,
        this.countryName,
        this.stateName});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contactId = json['contact_id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    landmark = json['landmark'];
    city = json['city'];
    pincode = json['pincode'];
    isDefault = json['is_default'];
    countryName = json['country_name'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contact_id'] = this.contactId;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['landmark'] = this.landmark;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['is_default'] = this.isDefault;
    data['country_name'] = this.countryName;
    data['state_name'] = this.stateName;
    return data;
  }
}