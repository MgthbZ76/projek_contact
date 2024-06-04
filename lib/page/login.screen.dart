import 'package:flutter/material.dart';
import 'package:projek_contact/component/costomized_button.dart';
import 'package:projek_contact/component/costomized_textfield.dart';
import 'package:projek_contact/page/_parentpage.dart';
import 'package:projek_contact/page/forgot_password.dart';
import 'package:projek_contact/page/signup_screen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  // Dummy credentials
  final String dummyEmail = 'a';
  final String dummyPassword = 'a';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Text('Login', style: TextStyle(
                      color: Colors.black, 
                      fontSize: 30, 
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  CostomizedTextfield(
                    myController: _emailcontroller,
                    hintText:'Enter Your Email',
                    isPassword: false,
                    ),
                  CostomizedTextfield(
                    myController: _passwordcontroller,
                    hintText:'Enter Your Password',
                    isPassword: true,
                  ),
                   Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding:  const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (_) =>const ForgotPassword()));
                        },
                        child: const Text('Forget Password?',
                          style: TextStyle(
                            color: Color(0xff6A707C),
                            fontSize: 15,
                          )),
                      ),
                    ),
                  ),
                CostomizedButton(
                buttonText: 'Login',
                buttonColor: Colors.black,
                textColor: Colors.white,
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    // Dummy login logic
                    if (_emailcontroller.text == dummyEmail && _passwordcontroller.text == dummyPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login successful')));
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ParentPage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid credentials')));
                    }
                  }
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
                    const Text("Don't have an account?",
                    style: TextStyle(
                      color: Color(0xff6A707C),
                      fontSize: 15,
                    )),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignUpScreen()));
                      },
                    child: const Text('Register Now',
                    style: TextStyle(
                      color: Color(0xff35C2C1),
                      fontSize: 15,
                    ),
                    ),
                    )
                  ],
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
