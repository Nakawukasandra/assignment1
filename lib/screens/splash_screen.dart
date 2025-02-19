import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinished;

  // ignore: use_super_parameters
  const SplashScreen({Key? key, required this.onFinished}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Create scale animation
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    // Create fade-in animation
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Start animation
    _controller.forward();

    // Navigate after splash duration
    Future.delayed(const Duration(seconds: 3), () {
      widget.onFinished();
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Opacity(
                      opacity: _opacityAnimation.value,
                      child: Image.asset(
                        'assets/images/skylogo.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
              
              // Spacing
              const SizedBox(height: 30),
              
              // Loading Indicator
              FadeTransition(
                opacity: _opacityAnimation,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  strokeWidth: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}