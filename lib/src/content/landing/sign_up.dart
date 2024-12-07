import 'package:flutter/material.dart';
import 'package:smart_lifters/src/db/prefs.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        title: const Text(
          'Create Account',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Let\'s Start',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Full name',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _usernameController,
                        style:
                            TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Full name',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          
                          filled: true,
                          fillColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Email address',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _emailController,
                        style:
                            TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Email address',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          
                          filled: true,
                          fillColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style:
                            TextStyle(color: Colors.white), // Text input style
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Password',
                          
                          labelStyle: TextStyle(
                            color: Colors.white, // Label text color
                          ),
                          filled: true,
                          fillColor: Colors.black, // Background color
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _passwordConfirmController,
                        obscureText: true,
                        style:
                            TextStyle(color: Colors.white), // Text input style
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Confirm Password',
                          
                          labelStyle: TextStyle(
                            color: Colors.white, // Label text color
                          ),
                          filled: true,
                          fillColor: Colors.black, // Background color
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Forgot Password?',style:
                            TextStyle(color: Colors.black),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  String name = _usernameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  String passwordConfirm = _passwordConfirmController.text;
                  bool allFilled = name.isNotEmpty && email.isNotEmpty && password.isNotEmpty && passwordConfirm.isNotEmpty;
                  bool passwordMatch = password == passwordConfirm;

                  if(!allFilled) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('You have not filled all the fields!'),
                    ));
                  } else if(!passwordMatch) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Passwords do not match!')
                    ));
                  } else {
                    User user = await localData.get('user_signup');
                    user.name = name;
                    user.email = email;
                    localData.put('user', user);
                    Navigator.pushNamed(context, '/home');
                  }
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 10
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style:
                                TextStyle(color: Colors.black),),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/onboarding/login', (route) => false,);
                    },
                    child:  Text('Login',style:
                                TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                  ),
              )],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
