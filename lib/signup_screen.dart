import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projek_contact/costomized_button.dart';
import 'package:projek_contact/costomized_textfield.dart';
import 'package:projek_contact/login.screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    child: Text('Hello! Register to get \nStarted', 
                      style: TextStyle(
                      color: Colors.black, 
                      fontSize: 30, 
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  CostomizedTextfield(
                    myController: _emailcontroller,
                    hintText:'Email',
                    isPassword: false,
                    ),
                  CostomizedTextfield(
                    myController: _passwordcontroller,
                    hintText:'Password',
                    isPassword: true,
                  ),
                   CostomizedTextfield(
                    myController: _confirmpasswordcontroller,
                    hintText:'Confirm Password',
                    isPassword: true,
                  ),
                   CostomizedTextfield(
                    myController: _passwordcontroller,
                    hintText:'Enter Your Password',
                    isPassword: true,
                  ),
                CostomizedButton(
                buttonText: 'Register',
                buttonColor: Colors.black,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const Loginscreen()));
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
                    const Text("Already have an account?",
                    style: TextStyle(
                      color: Color(0xff6A707C),
                      fontSize: 15,
                    )),
                    InkWell(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (_) => const Loginscreen()));
                    },
                    child:  const Text(" Login Now",
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
          ),
        ),
      ),
    ); 
  }
}