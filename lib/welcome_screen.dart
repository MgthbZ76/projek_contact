import 'package:flutter/material.dart';
import 'package:projek_contact/costomized_button.dart';
import 'package:projek_contact/login.screen.dart';
import 'package:projek_contact/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          //image
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox (
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
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> const Loginscreen()));
              },
            ),
            CostomizedButton(
              buttonText: 'Register',
              buttonColor: Colors.white,
              textColor: Colors.black,
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SignUpScreen()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
           const Padding(
             padding: EdgeInsets.all(10.0),
             child: Text('Continue as a Guest',
              style: TextStyle(color: Colors.indigo, fontSize: 25)
              ),
           ),
          ],
        ),
      ),
    );
  }
}