import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool fade = false;
  bool transition = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacementNamed('/portfolio');
    });
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        fade = true;
      });
    });
    Future.delayed(const Duration(seconds: 3)).then((value) {
      setState(() {
        transition = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: transition ? 0.0 : 1.0,
        child: ColoredBox(
          color: Theme.of(context).primaryColor,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
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
          ),
        ),
      ),
    );
  }
}
