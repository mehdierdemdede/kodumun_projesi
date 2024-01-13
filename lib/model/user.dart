import 'package:flutter_application_2/model/report_status.dart';

class User {
  final String firstName;
  final String lastName;
  final int age;
  final String number;
  final String date;
  ReportStatus reportStatus;

  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.number,
    required this.date,
    required this.reportStatus,
  });

  User copy({
    String? firstName,
    String? lastName,
    int? age,
    String? number,
    String? date,
    ReportStatus? reportStatus,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        age: age ?? this.age,
        date: date ?? this.date,
        reportStatus: reportStatus ?? this.reportStatus,
        number: number ?? this.number,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          age == other.age &&
          date == other.date &&
          reportStatus == other.reportStatus;

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      age.hashCode ^
      date.hashCode ^
      reportStatus.hashCode;
}
