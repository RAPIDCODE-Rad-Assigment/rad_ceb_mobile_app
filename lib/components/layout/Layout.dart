import 'package:flutter/material.dart';

import '../complaints/Complaints.dart';
import '../homepage/Homepage.dart';
import '../interruption/Interruptions.dart';
import '../profile/Profile.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  String? selectedAccount; // Stores selected account
  final List<String> userAccounts = ['Home', 'Office']; // Dummy account numbers
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Homepage(),
    Interruptions(),
    Complaints(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC58B2B),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButtonHideUnderline(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.transparent, // Blends with AppBar
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  isDense: true,
                  dropdownColor: Colors.white,
                  value:
                      selectedAccount ??
                      userAccounts.first, // Default to the first account
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 28,
                  ),
                  underline: SizedBox(), // Remove default underline
                  onChanged: (String? newValue) {
                    if (newValue == 'add_new') {
                      // Navigate to add account page or show a dialog
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LoginPage(),
                      //   ), // Replace with your page
                      // );
                    } else {
                      setState(() {
                        selectedAccount = newValue;
                      });
                    }
                  },
                  items: [
                    ...userAccounts.map<DropdownMenuItem<String>>((
                      String account,
                    ) {
                      return DropdownMenuItem<String>(
                        value: account,
                        child: Text(
                          account,
                          style: TextStyle(
                            color: Color(0xFF62270A),
                            fontSize: 16,
                          ),
                        ),
                      );
                    }).toList(),
                    // Add New Account option at the bottom
                    DropdownMenuItem<String>(
                      value: 'add_new',
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          Text(
                            "➕ Add New Account",
                            style: TextStyle(
                              color: Color(0xFF62270A),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset('assets/ceb-logo.png', width: 40, height: 40),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFC58B2B), // Your theme color
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        type:
            BottomNavigationBarType
                .fixed, // Ensures icons & text are always visible
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_rounded, size: 30),
            label: 'Interruptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_outlined, size: 30),
            label: 'Complaints',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 30),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
