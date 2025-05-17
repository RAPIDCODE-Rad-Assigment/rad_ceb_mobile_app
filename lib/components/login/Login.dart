import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../api-services/user-service.dart';
import '../../utils/auth_guard.dart';
import '../../utils/user-provier-service.dart';
import '../layout/Layout.dart';
import '../sign-up/SignUp.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<Map<String, dynamic>> _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    final response = await UserService.login({
      "email": email,
      "password": password,
    });

    print(response);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);

      return {
        "status": true,
        "token": body['token'],
        "message": body['message'],
      };
    } else if (response.statusCode == 401) {
      Map<String, dynamic> body = jsonDecode(response.body);

      Fluttertoast.showToast(
        msg: body['error'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return {"status": false, "err": body['error']};
    }
    return {"status": false};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 171, 156, 43),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ceb-logo.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF62270A),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.email, color: Color(0xFF62270A)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF62270A)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // // Navigator.push(
                        // //   context,
                        // //   MaterialPageRoute(builder: (context) => Layout()),
                        // // );

                        // Map<String, dynamic> result = await _login();

                        // // context.read<UserProviderService>().setId(
                        // //   id: result['id'],
                        // // );

                        // if (result['status'] == true) {
                        //   context.read<UserProviderService>().setToken(
                        //     token: result['access_token'],
                        //   );
                        //   // TokenService.setToken(body['token']);

                        //   // context.read<UserProviderService>().setUsername(
                        //   //   username: body['username'],
                        //   // );
                        //   // context.read<UserProviderService>().setFirstname(
                        //   //   firstname:
                        //   //       body['Name'].toString().split(' ').last,
                        //   // );
                        //   // context.read<AuthService>().setLastname(lastname: body['lastName']);

                        //   Fluttertoast.showToast(
                        //     msg: "Successfully LoggedIn",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.TOP,
                        //     timeInSecForIosWeb: 1,
                        //     backgroundColor: const Color(0xFF0ED178),
                        //     textColor: Colors.white,
                        //     fontSize: 16.0,
                        //   );
                        //   if (!mounted) return;

                        //   CustomNavigator.navigateIfAuthenticated(
                        //     context: context,
                        //     destination: Layout(),
                        //   );
                        // } else {}

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Layout()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFAE7B21),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        color: Color(0xFF62270A),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
