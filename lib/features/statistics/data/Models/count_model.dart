import 'package:flutter/material.dart';

class CountsData {
  final String name;
  final int totalcount;
  final int count;
  final Color color;

  CountsData(
      {required this.name,
      required this.totalcount,
      required this.count,
      required this.color});

  factory CountsData.fromJson(Map<String, dynamic> json) {
    return CountsData(
      name: json['userID'] as String,
      totalcount: json['userID'] as int,
      count: json['userID'] as int,
      color: json['userID'] as Color,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'totalcount': totalcount,
      'count': count,
      'color': color,
    };
  }
}
