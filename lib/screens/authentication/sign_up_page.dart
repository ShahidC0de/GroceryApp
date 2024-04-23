import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/backend/service_provider.dart';
import 'package:grocery_store/common_widgets/button_widget.dart';
import 'package:grocery_store/common_widgets/text_form_field.dart';
import 'package:grocery_store/screens/authentication/login_page.dart';
import 'package:grocery_store/screens/splash_screen.dart';
import 'package:grocery_store/styles/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = ServiceProvider();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                textEditingController: fullName,
                keyboardtype: TextInputType.name,
                hintText: 'Full Name',
                isObsecure: false,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                textEditingController: email,
                keyboardtype: TextInputType.emailAddress,
                hintText: 'Emaeil',
                isObsecure: false,
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                textEditingController: address,
                keyboardtype: TextInputType.streetAddress,
                hintText: 'Street Address',
                isObsecure: false,
                prefixIcon: const Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                textEditingController: password,
                keyboardtype: TextInputType.visiblePassword,
                hintText: 'Password',
                isObsecure: passwordVisibility,
                suffexIcon: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                    });
                  },
                  child: Icon(
                    passwordVisibility
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: passwordVisibility
                        ? AppColors.primaryColor
                        : Colors.grey,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.password,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                textEditingController: confirmPassword,
                keyboardtype: TextInputType.visiblePassword,
                hintText: 'Confirm Password',
                isObsecure: passwordVisibility,
                suffexIcon: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                    });
                  },
                  child: Icon(
                    passwordVisibility
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: passwordVisibility
                        ? AppColors.primaryColor
                        : Colors.grey,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.password,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.white,
              ),
              CustomButton(
                onpressed: () async {
                  await serviceProvider.creatingTheUser(
                    fullName.text,
                    address.text,
                    email.text,
                    password.text,
                  );
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SplashScreen(),
                    ),
                  );
                },
                buttonText: 'Sign up',
              ),
              const Divider(
                color: Colors.white,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Already have an account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
