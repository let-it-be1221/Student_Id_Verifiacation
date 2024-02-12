// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_id_verification/models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, FirebaseUser>((ref) {
  return UserNotifier();
});

class LocalUser {
  final String uid;
  final FirebaseUser user;
  LocalUser({
    required this.uid,
    required this.user,
  });

  LocalUser copyWith({
    String? uid,
    FirebaseUser? user,
  }) {
    return LocalUser(
      uid: uid ?? this.uid,
      user: user ?? this.user,
    );
  }
}

class UserNotifier extends StateNotifier<FirebaseUser> {
  UserNotifier()
      : super(FirebaseUser(
          email: 'error',
          firstName: 'error',
          middleName: 'error',
          lastName: 'error',
          department: 'error',
          sex: 'error',
          bach: 'error',
          studentPic: 'error',
          studentId: 'error',
          qrCode: 'error',
          postTime: Timestamp.now(),
        ));

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//User Login

  Future<void> Login(String email) async {
    QuerySnapshot response = await _firestore
        .collection("students")
        .where('email', isEqualTo: email)
        .get();

    if (response.docs.isEmpty) {
      print("No FireStore user associated to authenticated email $email");
      return;
    } else if (response.docs.length != 1) {
      print("More Than one Firestore user associated with email $email");
    }
  }

//User SignUn
  Future<void> Signup(String email) async {
    await _firestore.collection("students").add(FirebaseUser(
          email: email,
          firstName: 'noName',
          middleName: 'noName',
          lastName: 'noName',
          department: 'noDepartment',
          sex: '___',
          bach: '__',
          studentPic: 'https://cdn-icons-png.flaticon.com/128/847/847969.png',
          studentId: 'noId',
          qrCode: 'noQR',
          postTime: Timestamp.now(),
        ).toMap());
  }

  void logOut() {
    // state = LocalUser(
    //     uid: 'error',
    //     user: FirebaseUser(
    //         email: 'error',
    //         firstName: 'error',
    //         middleName: 'error',
    //         lastName: 'error',
    //         department: 'error',
    //         sex: 'error',
    //         bach: 'error',
    //         studentPic: 'error',
    //         studentId: 'error',
    //         qrCode: 'error',
    //         postTime: 'error'));
  }
  //
}
