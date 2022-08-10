import 'package:flutter/material.dart';
import 'package:mvvm_flutter/user_list/views/add_user_screen.dart';
import 'package:mvvm_flutter/user_list/views/user_detail_screen.dart';

class Navigation{
  static void openUserDetails(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UserDetailScreen(),
      ),
    );
  }

  static void openAddUser(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddUserScreen(),
      ),
    );
  }
}
