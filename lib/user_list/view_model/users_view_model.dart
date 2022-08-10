import 'package:flutter/material.dart';
import 'package:mvvm_flutter/user_list/models/user_error.dart';
import 'package:mvvm_flutter/user_list/models/users_lists_model.dart';
import 'package:mvvm_flutter/user_list/repo/api_status.dart';
import 'package:mvvm_flutter/user_list/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier{
  bool _isLoading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;
  UserModel? _selectedUser;
  UserModel? _addingUser = UserModel();

  bool get isLoading => _isLoading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel? get selectedUser => _selectedUser;
  UserModel? get addingUser => _addingUser;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool isLoading) async {
    _isLoading = isLoading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  addUsers() async {
    if(!isValid()) {
      return;
    }
    _userListModel.add(addingUser!);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if(addingUser!.name == null || addingUser!.name!.isEmpty) {
      return false;
    }
    if(addingUser!.email == null || addingUser!.email!.isEmpty) {
      return false;
    }
    return true;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if(response is Success){
      setUserListModel(response.response as List<UserModel>);
    }
    if(response is Failure){
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}