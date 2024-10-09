class AddContactResponse {
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? profile;
  List<ContactTypes>? contactTypes;
  List<Addresses>? addresses;

  AddContactResponse(
      {this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.profile,
      this.contactTypes,
      this.addresses});

  AddContactResponse.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    profile = json['profile'];
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
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['profile'] = this.profile;
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

  ContactTypes({this.id});

  ContactTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Addresses {
  String? addressLine1;
  String? addressLine2;
  String? landmark;
  String? countryId;
  String? stateId;
  String? city;
  String? pincode;
  int? isDefault;

  Addresses(
      {this.addressLine1,
      this.addressLine2,
      this.landmark,
      this.countryId,
      this.stateId,
      this.city,
      this.pincode,
      this.isDefault});

  Addresses.fromJson(Map<String, dynamic> json) {
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    landmark = json['landmark'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    city = json['city'];
    pincode = json['pincode'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['landmark'] = this.landmark;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['is_default'] = this.isDefault;
    return data;
  }
}
