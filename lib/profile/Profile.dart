import 'package:flutter/material.dart';
import 'package:rad_ceb_mobile_app/login/Login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 171, 156, 43),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 73,
                backgroundColor: Color(0xFFF8DE24),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                    'assets/profile.jpg',
                  ), // Replace with actual image
                ),
              ),
            ),
            SizedBox(height: 15),
            // Name
            Text(
              "Malindu Upendra",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            // Email
            Text(
              "malindu@codevus.com",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            // Profile Details Card
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFAE7B21),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                    bottom: Radius.circular(40),
                  ),
                  border: Border.all(
                    color: const Color.fromARGB(255, 255, 236, 93),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _profileOption(context, Icons.edit, "Edit Profile"),
                    Divider(color: Colors.white54),
                    _profileOption(context, Icons.settings, "Settings"),
                    Divider(color: Colors.white54),
                    _profileOption(
                      context,
                      Icons.logout,
                      "Logout",
                      isLogout: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileOption(
    BuildContext context,
    IconData icon,
    String text, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 18),
      onTap: () {
        if (text == "Edit Profile") {
          _showEditProfileBottomSheet(context);
        } else if (isLogout) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      },
    );
  }

  void _showEditProfileBottomSheet(BuildContext context) {
    TextEditingController emailController = TextEditingController(
      text: "malindu@codevus.com",
    );
    TextEditingController mobileController = TextEditingController(
      text: "0771234567",
    );

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Color(0xFFAE7B21),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: mobileController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Mobile",
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Save logic
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF62270A),
                    ),
                    child: Text("Save", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
