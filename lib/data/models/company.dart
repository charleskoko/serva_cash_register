import 'package:equatable/equatable.dart';


class Company extends Equatable {
  String id, label, address, phone, fax;

  Company(this.id, this.address, this.label, this.phone);

  Company.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.address = json['address'];
    this.label = json['label'];
    this.phone = json['phone'];
    this.fax = json['fax'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'address': address,
        'phone': phone,
        'fax': fax,
      };

  @override
  List<Object> get props => [id, address, label, phone, fax];
}
