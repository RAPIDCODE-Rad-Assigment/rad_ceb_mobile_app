import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:rad_ceb_mobile_app/login/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Fade animation for CEB
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Slide animation for "Ceylon Electricity Board"
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start animation
    _controller.forward();

    // Navigate to the next screen after 3 seconds
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF62270A), // Dark Brown Background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated CEB letters
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                "CEB",
                style: GoogleFonts.montserrat(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF8DE24), // Bright Yellow
                  letterSpacing: 5,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Animated "Ceylon Electricity Board"
            SlideTransition(
              position: _slideAnimation,
              child: Text(
                "Ceylon Electricity Board",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFAE7B21), // Golden Brown
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
