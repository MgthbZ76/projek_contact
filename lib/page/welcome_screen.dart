import 'package:flutter/material.dart';
import 'package:projek_contact/component/costomized_button.dart';
import 'package:projek_contact/page/login.screen.dart';
import 'package:projek_contact/page/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          //image
        ),
        child: Center(  // Center widget added
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column
            children: [
              const SizedBox(
                height: 130,
                width: 180,
                //image
              ),
              const SizedBox(
                height: 40,
              ),
              CostomizedButton(
                buttonText: 'Login',
                buttonColor: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const Loginscreen()));
                },
              ),
              CostomizedButton(
                buttonText: 'Register',
                buttonColor: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
