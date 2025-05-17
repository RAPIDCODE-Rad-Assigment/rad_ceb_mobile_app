import 'package:flutter/material.dart';
import 'shared-preferences.dart';

class UserProviderService extends ChangeNotifier {
  dynamic id;
  bool isLoggedIn;
  dynamic token;
  String username;
  String firstname;
  String lastname;

  UserProviderService({
    this.isLoggedIn = false,
    this.username = '',
    this.firstname = '',
    this.lastname = '',
  });

  // Initialize from SharedPreferences
  Future<void> initialize() async {
    token = await SharedPreferencesService.getToken();
    // id = await SharedPreferencesService.getId();
    isLoggedIn = (await SharedPreferencesService.getLoginStatus()) ?? false;
    // If token and ID exist, set the login status
    if (token != null) {
      isLoggedIn = true;
    }
    notifyListeners();
  }

  void setToken({required dynamic token}) async {
    this.token = token;
    SharedPreferencesService.setToken(token);
    isLoggedIn = true;
    notifyListeners();
  }

  void setId({required dynamic id}) async {
    this.id = id;
    SharedPreferencesService.setId(id);
    notifyListeners();
  }

  void setUsername({required String username}) async {
    this.username = username;
    notifyListeners();
  }

  void setFirstname({required String firstname}) async {
    this.firstname = firstname;
    notifyListeners();
  }

  void setLastname({required String lastname}) async {
    this.lastname = lastname;
    notifyListeners();
  }

  void logout() {
    id = null;
    token = null;
    isLoggedIn = false;
    username = '';
    firstname = '';
    lastname = '';
    SharedPreferencesService.clearAll();
  }

  get getToken => token;
}
