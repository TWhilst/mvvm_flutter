import 'package:flutter/material.dart';
import 'package:mvvm_flutter/components/app_error.dart';
import 'package:mvvm_flutter/components/app_loading.dart';
import 'package:mvvm_flutter/components/users_list_row.dart';
import 'package:mvvm_flutter/user_list/models/users_lists_model.dart';
import 'package:mvvm_flutter/user_list/view_model/users_view_model.dart';
import 'package:mvvm_flutter/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel userViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async => Navigation.openAddUser(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _ui(userViewModel),
          ],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel){
    if(usersViewModel.isLoading){
      return const AppLoading();
    }
    if(usersViewModel.userError != null){
      return AppError(
        errorTxt: usersViewModel.userError!.message.toString(),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModel.userListModel[index];
          return UserListRow(
            userModel: userModel,
            onTap: () async {
              usersViewModel.setSelectedUser(userModel);
              Navigation.openUserDetails(context);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: usersViewModel.userListModel.length,
      ),
    );
  }
}

