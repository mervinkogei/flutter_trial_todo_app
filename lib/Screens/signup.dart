import 'package:flutter/material.dart';
import 'package:trial_todo_app/Screens/login.dart';
import 'package:trial_todo_app/Utils/app_Colors.dart';
import 'package:trial_todo_app/Utils/textStyling.dart';
import 'package:trial_todo_app/components/custom_checkBox.dart';
import 'package:trial_todo_app/components/custom_elavatedButton.dart';
import 'package:trial_todo_app/components/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


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
                    'Hi There, Lets Onboard you 👋', style: ThemeStyling.welcomeTitle,
                  ),
                  const Text(
                    'Please enter your name,email, password & Confirm password to onboard you.',
                    
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   const Text(
                    'Name',
                  ),
                  CustomTextField(controller: nameController, obscure: false),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Email',
                  ),
                  CustomTextField(controller: emailController, obscure: false),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Password',
                  ),
            CustomTextField(controller: passwordController, obscure: true, visibilityIcon: true,),
             const SizedBox(
                    height: 10,
                  ),
            const Text(
                    'ConfirmPassword',
                  ),
            CustomTextField(controller: confirmPasswordController, obscure: true, visibilityIcon: true,),
            const SizedBox(height: 10),
                  Row(
                    children: [
                      CustomCheckBox(
                        checked: true,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Remember me',
                      ),
                    
                    ],
                  ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  const Divider(color: AppColors.kGreyScale200),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                          (route) => false);
                        },
                        child: const Text(
                          'Sign In', style: ThemeStyling.signUpText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButtton(
                    callback: () async {},
                    labelTitle: 'Sign Up',
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

