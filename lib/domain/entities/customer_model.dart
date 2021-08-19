import 'dart:convert';

import 'data_entry/custom_variables.dart';
import 'payment_method_model.dart';

class CustomersModel {
  int totalItems;
  List<CustomerModel>? items;
  CustomersModel({
    this.totalItems = 0,
    this.items,
  });

  CustomersModel copyWith({
    int? totalItems,
    List<CustomerModel>? items,
  }) {
    return CustomersModel(
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total_items': totalItems,
      'items': items?.map((x) => x.toMap()).toList(),
    };
  }

  factory CustomersModel.fromMap(Map<String, dynamic> map) {
    return CustomersModel(
      totalItems: map['total_items'] ?? map['totalItems'],
      items: List<CustomerModel>.from(
          map['items']?.map((x) => CustomerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomersModel.fromJson(String source) =>
      CustomersModel.fromMap(json.decode(source));

  @override
  String toString() => 'CustomersModel(totalItems: $totalItems, items: $items)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CustomersModel && o.totalItems == totalItems;
  }

  @override
  int get hashCode => totalItems.hashCode ^ items.hashCode;
}

class CustomerModel {
  String? id;
  String? email;
  String? name;
  String? notes;
  String? createdAt;
  String? updatedAt;
  String? ccEmails;
  String? cpfCnpj;
  String? zipCode;
  String? number;
  String? complement;
  String? phone;
  String? phonePrefix;
  String? defaultPaymentMethodId;
  String? city;
  String? state;
  String? district;
  String? street;
  List<CustomVariables>? customVariables;
  List<PaymentMethodModel>? paymentMethods;

  CustomerModel(
      {this.id,
      this.email,
      this.name,
      this.notes,
      this.createdAt,
      this.updatedAt,
      this.ccEmails,
      this.cpfCnpj,
      this.zipCode,
      this.number,
      this.complement,
      this.phone,
      this.phonePrefix,
      this.defaultPaymentMethodId,
      this.city,
      this.state,
      this.district,
      this.street,
      this.customVariables,
      this.paymentMethods});

  CustomerModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ccEmails = json['cc_emails'];
    cpfCnpj = json['cpf_cnpj'];
    zipCode = json['zip_code'];
    number = json['number'];
    complement = json['complement'];
    phone = json['phone'];
    phonePrefix = json['phone_prefix'];
    defaultPaymentMethodId = json['default_payment_method_id'];
    city = json['city'];
    state = json['state'];
    district = json['district'];
    street = json['street'];
    if (json['custom_variables'] != null) {
      customVariables = [];
      json['custom_variables'].forEach((v) {
        customVariables?.add(new CustomVariables.fromMap(v));
      });
    }
    if (json['payment_methods'] != null) {
      paymentMethods = [];
      json['payment_methods'].forEach((v) {
        paymentMethods?.add(new PaymentMethodModel.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['notes'] = this.notes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['cc_emails'] = this.ccEmails;
    data['cpf_cnpj'] = this.cpfCnpj;
    data['zip_code'] = this.zipCode;
    data['number'] = this.number;
    data['complement'] = this.complement;
    data['phone'] = this.phone;
    data['phone_prefix'] = this.phonePrefix;
    data['default_payment_method_id'] = this.defaultPaymentMethodId;
    data['city'] = this.city;
    data['state'] = this.state;
    data['district'] = this.district;
    data['street'] = this.street;
    if (this.customVariables != null) {
      data['custom_variables'] =
          this.customVariables?.map((v) => v.toJson()).toList();
    }
    if (this.paymentMethods != null) {
      data['payment_methods'] =
          this.paymentMethods?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
