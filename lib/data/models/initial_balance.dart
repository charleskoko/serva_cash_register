import 'package:equatable/equatable.dart';

import 'category.dart';

class InitialBalance extends Equatable {
  String id, startService, endService;
  double value;

  InitialBalance(this.id, this.startService, this.endService, this.value);

  InitialBalance.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.value = json['value'].toDouble();
    this.startService = json['start_service'];
    this.endService = json['end_service'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'startService': startService,
        'endService': endService,
      };

  @override
  List<Object> get props => [id, startService, endService];
}
