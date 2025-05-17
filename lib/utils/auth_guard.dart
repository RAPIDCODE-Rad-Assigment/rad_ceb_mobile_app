import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../components/login/Login.dart';
import 'user-provier-service.dart';

class CustomNavigator {
  static void navigateIfAuthenticated({
    required BuildContext context,
    required Widget destination,
  }) {
    final authProvider = Provider.of<UserProviderService>(
      context,
      listen: false,
    );
    final String? token = authProvider.token;

    if (token != null && token.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    } else {
      Fluttertoast.showToast(msg: "Please login first");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }
}
