// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUser {
  final String? email;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? department;
  final String? sex;
  final String? bach;
  final String? studentPic;
  final String? studentId;
  final String? qrCode;
  final Timestamp? postTime;

  FirebaseUser({
     this.email,
     this.firstName,
     this.middleName,
     this.lastName,
     this.department,
     this.sex,
     this.bach,
     this.studentPic,
     this.studentId,
     this.qrCode,
     this.postTime,
  });

   

  FirebaseUser copyWith({
    String? email,
    String? firstName,
    String? middleName,
    String? lastName,
    String? department,
    String? sex,
    String? bach,
    String? studentPic,
    String? studentId,
    String? qrCode,
    Timestamp? postTime,
  }) {
    return FirebaseUser(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      department: department ?? this.department,
      sex: sex ?? this.sex,
      bach: bach ?? this.bach,
      studentPic: studentPic ?? this.studentPic,
      studentId: studentId ?? this.studentId,
      qrCode: qrCode ?? this.qrCode,
      postTime: postTime ?? this.postTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'department': department,
      'sex': sex,
      'bach': bach,
      'studentPic': studentPic,
      'studentId': studentId,
      'qrCode': qrCode,
      'postTime': postTime,
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    return FirebaseUser(
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      middleName: map['middleName'] as String,
      lastName: map['lastName'] as String,
      department: map['department'] as String,
      sex: map['sex'] as String,
      bach: map['bach'] as String,
      studentPic: map['studentPic'] as String,
      studentId: map['studentId'] as String,
      qrCode: map['qrCode'] as String,
      postTime: map['postTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUser.fromJson(String source) => FirebaseUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FirebaseUser(email: $email,   firstName: $firstName, middleName: $middleName, lastName: $lastName, department: $department, sex: $sex, bach: $bach, studentPic: $studentPic, studentId: $studentId, qrCode: $qrCode, postTime: $postTime)';
  }

  @override
  bool operator ==(covariant FirebaseUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.firstName == firstName &&
      other.middleName == middleName &&
      other.lastName == lastName &&
      other.department == department &&
      other.sex == sex &&
      other.bach == bach &&
      other.studentPic == studentPic &&
      other.studentId == studentId &&
      other.qrCode == qrCode &&
      other.postTime == postTime;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      firstName.hashCode ^
      middleName.hashCode ^
      lastName.hashCode ^
      department.hashCode ^
      sex.hashCode ^
      bach.hashCode ^
      studentPic.hashCode ^
      studentId.hashCode ^
      qrCode.hashCode ^
      postTime.hashCode;
  }
}
