import 'package:cat_break/providers/cat_provider.dart';
import 'package:cat_break/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _fetchCatsBreeds() async {
    await Provider.of<CatProvider>(context, listen: false).fetchCatBreeds();

    if (mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCatsBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const RotatedBox(
                  quarterTurns: 90,
                  child: Image(
                    image: AssetImage('assets/icons/paw.png'),
                    height: 200,
                  )),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Cat Break',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade900,
                ),
              ),
              const SizedBox(height: 30),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink.shade900),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                color: Colors.pink.shade900,
                child: const Text(
                  'have a Break, have a Kitty-Cat',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ));
  }
}
