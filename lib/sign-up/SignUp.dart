import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rad_ceb_mobile_app/login/Login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        171,
        156,
        43,
      ), // Updated Background
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 150.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF62270A),
                  ),
                ),
                const SizedBox(height: 20),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildInputField(
                        "Account Number",
                        Icons.account_balance,
                        _accountController,
                        TextInputType.number,
                      ),
                      _buildInputField(
                        "Mobile Number",
                        Icons.phone,
                        _mobileController,
                        TextInputType.phone,
                      ),
                      _buildInputField(
                        "Email",
                        Icons.email,
                        _emailController,
                        TextInputType.emailAddress,
                      ),
                      _buildPasswordField(
                        "Password",
                        Icons.lock,
                        _passwordController,
                        true,
                      ),
                      _buildPasswordField(
                        "Confirm Password",
                        Icons.lock_outline,
                        _confirmPasswordController,
                        false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Sign Up Button (Updated Style)
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Sign Up Successful!")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAE7B21), // Golden Brown
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Already have an account?
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text(
                    "Already have an account? Login",
                    style: TextStyle(color: Color(0xFF62270A), fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Input Field (Updated Style)
  Widget _buildInputField(
    String label,
    IconData icon,
    TextEditingController controller,
    TextInputType keyboardType,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(icon, color: const Color(0xFF62270A)), // Brown Icon
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "$label is required";
          return null;
        },
      ),
    );
  }

  // Password Field (Updated Style)
  Widget _buildPasswordField(
    String label,
    IconData icon,
    TextEditingController controller,
    bool isPassword,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? _obscurePassword : _obscureConfirmPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(icon, color: const Color(0xFF62270A)), // Brown Icon
          suffixIcon: IconButton(
            icon: Icon(
              isPassword
                  ? (_obscurePassword ? Icons.visibility_off : Icons.visibility)
                  : (_obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility),
              color: Colors.black54,
            ),
            onPressed: () {
              setState(() {
                if (isPassword) {
                  _obscurePassword = !_obscurePassword;
                } else {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                }
              });
            },
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "$label is required";
          if (isPassword && value.length < 6)
            return "Password must be at least 6 characters";
          if (!isPassword && value != _passwordController.text)
            return "Passwords do not match";
          return null;
        },
      ),
    );
  }
}
