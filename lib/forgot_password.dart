import 'package:flutter/material.dart';
import 'package:projek_contact/component/costomized_button.dart';
import 'package:projek_contact/component/costomized_textfield.dart';
import 'package:projek_contact/login.screen.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 1),
                        borderRadius: BorderRadius.circular(10),
                
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                      }),
                    ),
                    ),
                  ),
              ),
              const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Forgot Password', style: TextStyle(
                    color: Colors.black, 
                    fontSize: 30, 
                    fontWeight: FontWeight.bold,
                  )),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Don't worry it occurs to us all. We will send you a link to reset your password.",
                  style: TextStyle(
                    color: Color(0xf8391A1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                CostomizedTextfield(
                  myController: _emailcontroller,
                  hintText: 'Enter your email',
                  isPassword: false,
                  ),
                CostomizedButton(
                  buttonText: 'Send Code',
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                padding: const EdgeInsets.fromLTRB(48,8,8,8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Remember Password?",
                    style: TextStyle(
                      color: Color(0xff6A707C),
                      fontSize: 15,
                    )),
                    InkWell(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Loginscreen()));
                    },
                    child:  const Text("Login",
                    style: TextStyle(
                      color: Color(0xff35C2C1),
                      fontSize: 15,
                    )),
                  ),
                  ],
                ),
              ),
          ],
        ),
      ),));
  }
}