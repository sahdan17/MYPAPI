import 'dart:io';

import 'package:flutter/material.dart';

import '../models/api_res.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

// import 'login.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  // get user detail
  Future<void> getUser() async {
    // panggil response dari model
    ApiResponse response = await getUserDetail();
    // jika response berhasil
    if (response.error == null) {
      // masukan data ke list _postList = []
      debugPrint('Response: ${response.data}');
      setState(() {
        user = response.data as User;
      });
    } else {
      // jika gagal
      print(response.error);
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('user: ${user?.idStore} | ${user?.username}'),
    );
  }
}
