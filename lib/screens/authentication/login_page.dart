import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/backend/service_provider.dart';
import 'package:grocery_store/common_widgets/button_widget.dart';
import 'package:grocery_store/common_widgets/text_form_field.dart';
import 'package:grocery_store/screens/authentication/sign_up_page.dart';
import 'package:grocery_store/screens/home/home_screen.dart';
import 'package:grocery_store/styles/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ServiceProvider _serviceProvider = ServiceProvider();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xff53B175),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              textEditingController: email,
              keyboardtype: TextInputType.emailAddress,
              hintText: 'Email',
              isObsecure: false,
              prefixIcon: const Icon(
                Icons.email,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              textEditingController: password,
              keyboardtype: TextInputType.visiblePassword,
              hintText: 'Password',
              isObsecure: visibility,
              prefixIcon: const Icon(
                Icons.password,
                color: AppColors.primaryColor,
              ),
              suffexIcon: CupertinoButton(
                onPressed: () {
                  setState(() {
                    visibility = !visibility;
                  });
                },
                child: Icon(
                  visibility ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onpressed: () async {
                bool isUseSignedIn = await _serviceProvider.signingInTheUser(
                    email.text, password.text);
                if (isUseSignedIn) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                } else {
                  // ignore: avoid_print
                  print('wrong credientials sorry');
                }
              },
              buttonText: 'Login',
            ),
            const Spacer(),
            const Divider(
              color: AppColors.primaryColor,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: const Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
