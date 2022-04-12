import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';
import 'package:samedu/src/widgets/title/title_02.dart';
import '../../theme/app_theme.dart';
import '../../widgets/button/main_button.dart';
import '../../widgets/text_field/text_field_01.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passAgainController = TextEditingController();
  bool onHover = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 64,
        leading: Row(
          children: [
            const SizedBox(width: 24),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 40,
                width: 40,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/left.svg',
                    color: AppTheme.dark,
                  ),
                ),
              ),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: GestureDetector(
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
                  const Title02(text: 'Confirm password'),
                  const SizedBox(height: 12),
                  TextField01(
                    controller: _passAgainController,
                    hint: 'Your password again',
                    pass: true,
                  ),
                  const SizedBox(height: 16),
                  Row(),
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
                left: 24,
                right: 24,
                top: 20,
              ),
              child: MainButton(
                text: 'Sign in',
                onHover: onHover,
                onLoading: _isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
