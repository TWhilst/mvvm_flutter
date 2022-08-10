import 'package:flutter/material.dart';
import 'package:mvvm_flutter/user_list/view_model/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel userViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              bool userAdded = await userViewModel.addUsers();
              if(!userAdded) {
                return;
              }
              print("The Value is ${userViewModel.addingUser}");
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body:  Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Name"
              ),
              onChanged: (value) async {
                userViewModel.addingUser!.name = value;
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Email"
              ),
              onChanged: (value) async {
                userViewModel.addingUser!.email = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
