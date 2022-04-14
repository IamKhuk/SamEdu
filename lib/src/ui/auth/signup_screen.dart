import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samedu/src/dialog/bottom_dialog.dart';
import 'package:samedu/src/ui/auth/verification_screen.dart';
import 'package:samedu/src/utils/utils.dart';
import 'dart:io';
import 'package:samedu/src/widgets/title/title_02.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    if (_emailController.text.isNotEmpty &&
        _passController.text.isNotEmpty &&
        _passAgainController.text.isNotEmpty){
      setState(() {
        onHover = false;
      });
    }else{
      setState(() {
        onHover = true;
      });
    }
    return Scaffold(
      backgroundColor: AppTheme.white,
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  const SizedBox(height: 30),
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
              child: GestureDetector(
                onTap: () {
                  if (_emailController.text.isNotEmpty &&
                      _passController.text.isNotEmpty &&
                      _passAgainController.text.isNotEmpty) {
                    setState(() {
                      _isLoading = true;
                    });
                    _saveInfo(
                      _emailController.text,
                      _passController.text,
                      _passAgainController.text,
                    );
                    setState(() {
                      _isLoading = false;
                    });
                  } else {
                    BottomDialog.showFailed(
                      context,
                      'Action Failed',
                      'Please fill up all forms to continue',
                    );
                  }
                },
                child: MainButton(
                  text: 'Sign in',
                  onHover: onHover,
                  onLoading: _isLoading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveInfo(
    String e,
    String pas,
    String pasAgain,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = e.replaceAll(' ', '');
    String password = pas.replaceAll(' ', '');

    if (Utils.emailValidator(
          email,
        ) ==
        true) {
      if (Utils.passwordValidator(password) == true) {
        if (password == _passAgainController.text) {
          prefs.setString("email", e);
          prefs.setString("password", pas);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return VerificationScreen(
                  email: email,
                  password: password,
                );
              },
            ),
          );
        } else {
          BottomDialog.showFailed(
            context,
            'Confirm Password Failed',
            'Please enter the same password you used above',
          );
        }
      } else {
        BottomDialog.showFailed(
          context,
          'Password is too Weak',
          'Password must be at least 8 character long and must contain at least 1 number, 1 Uppercase letter and 1 special character',
        );
      }
    } else {
      BottomDialog.showFailed(
        context,
        'Invalid Email Address',
        'Please enter valid email address so that we can register you correctly',
      );
    }
  }
}
