import 'package:flutter/material.dart';
import 'package:mvvm_flutter/components/app_title.dart';
import 'package:mvvm_flutter/user_list/models/users_lists_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final Function() onTap;
  const UserListRow({Key? key, required this.userModel, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: userModel.name!),
            Text(userModel.email!, style: const TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
