import 'package:flutter/material.dart';
import 'package:mvvm_flutter/components/app_title.dart';
import 'package:mvvm_flutter/user_list/view_model/users_view_model.dart';
import 'package:mvvm_flutter/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel userViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(userViewModel.selectedUser!.name!),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: userViewModel.selectedUser!.name!),
            Text(userViewModel.selectedUser!.email!, style: const TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
