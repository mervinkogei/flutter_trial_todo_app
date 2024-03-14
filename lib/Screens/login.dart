import 'package:flutter/material.dart';
import 'package:trial_todo_app/Screens/signup.dart';
import 'package:trial_todo_app/Utils/app_Colors.dart';
import 'package:trial_todo_app/Utils/textStyling.dart';
import 'package:trial_todo_app/components/custom_checkBox.dart';
import 'package:trial_todo_app/components/custom_elavatedButton.dart';
import 'package:trial_todo_app/components/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUser() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(
                left: 24, right: 24, top: MediaQuery.of(context).padding.top),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Welcome back 👋',
                    style: ThemeStyling.welcomeTitle,
                  ),
                  const Text(
                    'Please enter your email & password to sign in.',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Email',
                  ),
                  CustomTextField(controller: emailController, obscure: false, hintText: 'email',),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Password',
                  ),
                  CustomTextField(
                    controller: passwordController,
                    obscure: true,
                    visibilityIcon: true,
                    hintText: 'password',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CustomCheckBox(
                        checked: true,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Remember me',
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Forgot password?',
                          style: ThemeStyling.forgotPasswordText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(color: AppColors.kGreyScale200),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()),
                                  (route) => false);
                        },
                        child: const Text(
                          'Sign up',
                          style: ThemeStyling.signUpText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButtton(
                    callback: () => loginUser(),
                    labelTitle: 'Sign in',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
