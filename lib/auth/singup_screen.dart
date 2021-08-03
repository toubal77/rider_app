import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rider_app/auth/login_screen.dart';
import 'package:rider_app/main.dart';

class SingUpScreen extends StatefulWidget {
  static const String idScreen = "singUp";

  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  Future submitForm() async {
    FocusScope.of(context).unfocus();
    _formKey.currentState!.save();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      final auth = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      if (auth != null) {
        Map userData = {
          'name': nameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
        };
        userRef
            .child(auth.uid)
            .set(userData)
            .then((value) => print('user created'))
            .catchError((value) => print('error to create user {$value}'));
      } else
        print('error to create user Auth');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 15.0,
              ),
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 300,
                height: 300,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Register as Rider',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Brand Bold',
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Enter a valid username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          nameController.text = value!.trim();
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          emailController.text = value!.trim();
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 9) {
                            return 'Enter a valid phone';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          phoneController.text = value!.trim();
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          passwordController.text = value!.trim();
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextButton(
                        onPressed: submitForm,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          height: 50,
                          child: Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Brand Bold',
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Already have on Account? Login Here',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
