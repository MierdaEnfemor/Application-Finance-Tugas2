import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // untuk efek shimmer-like

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Navigasi otomatis ke HomeScreen setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
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
      backgroundColor: const Color.fromARGB(
        255,
        186,
        127,
        173,
      ), // fallback jika gambar belum dimuat
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Konten tengah
          Center(
            child: FadeTransition(
              opacity: _fade,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo kecil di tengah
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/logo.jpg',
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Efek shimmer sederhana tanpa package
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final shimmerPosition =
                          (_controller.value * 2) - 1; // bolak-balik

                      return ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: const [
                              Colors.white54,
                              Color.fromARGB(255, 239, 4, 180),
                              Colors.white54,
                            ],
                            stops: [
                              (0.5 + shimmerPosition / 3).clamp(0.0, 1.0),
                              (0.6 + shimmerPosition / 3).clamp(0.0, 1.0),
                              (0.7 + shimmerPosition / 3).clamp(0.0, 1.0),
                            ],
                          ).createShader(rect);
                        },
                        child: const Text(
                          'Finance Mate',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
