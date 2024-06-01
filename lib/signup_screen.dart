import 'package:flutter/material.dart';
import 'package:projek_contact/costomized_button.dart';
import 'package:projek_contact/costomized_textfield.dart';
import 'package:projek_contact/login.screen.dart';
import 'package:projek_contact/loading_screen.dart';// Import LoadingScreen

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  Future<bool> _register() async {
    // Di sini Anda dapat menambahkan logika untuk registrasi
    // Misalnya, melakukan validasi, memanggil API, dll.
    await Future.delayed(const Duration(seconds: 2)); // Contoh delay 2 detik
    return true; // Kembalikan true jika registrasi berhasil
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    myController: _emailController,
                    hintText:'Email',
                    isPassword: false,
                    ),
                  CostomizedTextfield(
                    myController: _usernameController,
                    hintText:'Username',
                    isPassword: false,
                  ),
                   CostomizedTextfield(
                    myController: _confirmPasswordController,
                    hintText:'Confirm Password',
                    isPassword: true,
                  ),
                   CostomizedTextfield(
                    myController: _passwordController,
                    hintText:'Enter Your Password',
                    isPassword: true,
                  ),
                _isLoading
                    ? const LoadingScreen() // Tampilkan LoadingScreen jika _isLoading true
                    : CostomizedButton(
                        buttonText: 'Register',
                        buttonColor: Colors.black,
                        textColor: Colors.white,
                        onPressed: () async {
                          setState(() {
                            _isLoading = true; // Set _isLoading menjadi true saat proses loading dimulai
                          });

                          // Lakukan proses registrasi
                          bool success = await _register();

                          setState(() {
                            _isLoading = false; // Set _isLoading menjadi false setelah proses loading selesai
                          });

                          if (success) {
                            // Navigasi ke layar login jika registrasi berhasil
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const Loginscreen()));
                          } else {
                            // Tampilkan pesan kesalahan jika registrasi gagal
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('Registration failed'),
                            ));
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
                    child:  const Text("Login Now",
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

  bool _isLoading = false; // Tambahkan boolean flag isLoading
}
