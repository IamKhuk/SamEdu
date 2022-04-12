import 'package:flutter/material.dart';
import 'package:samedu/src/ui/auth/signup_screen.dart';
import 'package:samedu/src/widgets/button/main_button.dart';
import 'package:samedu/src/widgets/text_field/text_field_01.dart';
import 'package:samedu/src/widgets/title/title_02.dart';
import 'dart:io';

import '../../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 72),
                const Text(
                  'Welcome to\nSamEdu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    fontFamily: AppTheme.fontFamily,
                    height: 1.44,
                    color: AppTheme.dark,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 80),
                const Title02(text: 'Email'),
                const SizedBox(height: 12),
                TextField01(
                  controller: _emailController,
                  hint: 'Your email',
                  pass: false,
                ),
                const SizedBox(height: 16),
                const Title02(text: 'Password'),
                const SizedBox(height: 12),
                TextField01(
                  controller: _passController,
                  hint: 'Your password',
                  pass: true,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.5,
                            color: AppTheme.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                MainButton(
                  text: 'Sign in',
                  onHover: onHover,
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppTheme.gray,
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: Platform.isIOS ? 32 : 24,
              left: 16,
              right: 16,
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have account?',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.5,
                    fontFamily: AppTheme.fontFamily,
                    color: AppTheme.gray,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.5,
                      fontFamily: AppTheme.fontFamily,
                      color: AppTheme.blue,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
