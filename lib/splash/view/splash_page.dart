import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool fade = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacementNamed('/portifolio');
    });
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        fade = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: fade ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                'images/LOGO.png',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
