import 'package:firebase_chat_demo/components/my_button.dart';
import 'package:firebase_chat_demo/components/my_text_field.dart';
import 'package:firebase_chat_demo/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.message,
                    size: 100,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Let\'s create an account for you',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                      controller: emailController,
                      obsecure: false,
                      hintText: 'Email'),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: passwordController,
                      obsecure: true,
                      hintText: 'Password'),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: confirmPasswordController,
                      obsecure: true,
                      hintText: 'Confirm Password'),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(onTap: signUp, title: 'Sign Up'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a member?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login Now',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp() {
    try {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Password and confirm password are not same')));
        return;
      } else {
        Provider.of<AuthService>(context, listen: false)
            .signUp(emailController.text, passwordController.text);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
