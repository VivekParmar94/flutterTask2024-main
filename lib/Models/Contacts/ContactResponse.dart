class ContactResponse {
  bool? status;
  String? message;
  List<Data>? data;

  ContactResponse({this.status, this.message, this.data});

  ContactResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? profile;
  String? companyId;
  String? companyName;
  String? branchId;
  String? branchName;
  dynamic departmentId;
  dynamic departmentName;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<ContactTypes>? contactTypes;
  List<Addresses>? addresses;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.profile,
      this.companyId,
      this.companyName,
      this.branchId,
      this.branchName,
      this.departmentId,
      this.departmentName,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.contactTypes,
      this.addresses});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'] != null ? json['first_name'] : "-";

    lastName = json['last_name'] != null ? json['last_name'] : "-";

    mobile = json['mobile'] != null ? json['mobile'] : "-";
    email = json['email'] != null ? json['email'] : "-";
    profile = json['profile'];
    companyId = json['company_id'];
    companyName = json['company_name'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['profile'] = this.profile;
    data['company_id'] = this.companyId;
    data['company_name'] = this.companyName;
    data['branch_id'] = this.branchId;
    data['branch_name'] = this.branchName;
    data['department_id'] = this.departmentId;
    data['department_name'] = this.departmentName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.contactTypes != null) {
      data['contact_types'] =
          this.contactTypes!.map((v) => v.toJson()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactTypes {
  String? id;
  String? name;
  Pivot? pivot;

  ContactTypes({this.id, this.name, this.pivot});

  ContactTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
  String? addressLine1;
  String? addressLine2;
  String? landmark;
  String? city;
  String? pincode;
  int? countryId;
  int? stateId;
  int? isDefault;
  String? countryName;
  String? stateName;
  String? createdAt;
  String? updatedAt;

  Addresses(
      {this.id,
      this.addressLine1,
      this.addressLine2,
      this.landmark,
      this.city,
      this.pincode,
      this.countryId,
      this.stateId,
      this.isDefault,
      this.countryName,
      this.stateName,
      this.createdAt,
      this.updatedAt});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    landmark = json['landmark'];
    city = json['city'];
    pincode = json['pincode'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    isDefault = json['is_default'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['landmark'] = this.landmark;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['is_default'] = this.isDefault;
    data['country_name'] = this.countryName;
    data['state_name'] = this.stateName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
