import 'package:faithful_servant/features/personal/data/Models/services_history_model/history_submodel.dart';

class ServiceHistoryModel {
  final String code;
  final History history;

  ServiceHistoryModel({required this.code, required this.history});

  factory ServiceHistoryModel.fromJson(Map<String, dynamic> json) {
    return ServiceHistoryModel(
      code: json['code'] as String,
      history: json['history'] as History,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'history': history,
    };
  }
}
