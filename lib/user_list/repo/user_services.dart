import 'dart:io';

import 'package:http/http.dart'as http;
import 'package:mvvm_flutter/user_list/models/users_lists_model.dart';
import 'package:mvvm_flutter/user_list/repo/api_status.dart';
import 'package:mvvm_flutter/utils/constants.dart';

class UserServices{
  static Future<Object> getUsers() async {
    try{
      var url = Uri.parse(Constants.userListUrl);
      var response = await http.get(url);

      if(response.statusCode == 200) {
        return Success(response: userModelFromJson(response.body));
      }
      return Failure(errorResponse: "Invalid Response", code: Constants.invalidResponse, );
    }
    on HttpException{
      return Failure(errorResponse: "No Internet", code: Constants.noInternet, );
    }
    on FormatException{
      return Failure(errorResponse: "Invalid Format", code: Constants.invalidFormat, );
    }
    catch(e) {
      return Failure(errorResponse: "Unknown Error", code: Constants.unknownError, );
    }
  }
}