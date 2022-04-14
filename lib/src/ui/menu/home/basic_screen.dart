import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samedu/src/ui/auth/login_screen.dart';
import 'package:samedu/src/widgets/title/title_02.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../../dialog/bottom_dialog.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/button/main_button.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  DateTime birthDate = DateTime.now();
  bool onHover = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (_firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        birthDate != DateTime.now()) {
      setState(() {
        onHover = false;
      });
    } else {
      setState(() {
        onHover = true;
      });
    }
    return Scaffold(
      backgroundColor: AppTheme.white,
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
                  const SizedBox(height: 72),
                  const Text(
                    'One small step...',
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
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Title02(text: 'First name'),
                          const SizedBox(height: 12),
                          Container(
                            height: 44,
                            width: (MediaQuery.of(context).size.width - 64)/2,
                            decoration: BoxDecoration(
                              color: AppTheme.lightTwo,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 7),
                                  blurRadius: 55,
                                  spreadRadius: 0,
                                  color: const Color(0xFF939393).withOpacity(0.07),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              child: TextFormField(
                                enabled: true,
                                controller: _firstNameController,
                                enableSuggestions: true,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor: AppTheme.blue,
                                enableInteractiveSelection: true,
                                obscureText: false,
                                style: const TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AppTheme.dark,
                                ),
                                autofocus: false,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Your first name',
                                  hintStyle: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.light,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Title02(text: 'Last name'),
                          const SizedBox(height: 12),
                          Container(
                            height: 44,
                            width: (MediaQuery.of(context).size.width - 64)/2,
                            decoration: BoxDecoration(
                              color: AppTheme.lightTwo,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 7),
                                  blurRadius: 55,
                                  spreadRadius: 0,
                                  color: const Color(0xFF939393).withOpacity(0.07),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              child: TextFormField(
                                enabled: true,
                                controller: _lastNameController,
                                enableSuggestions: true,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor: AppTheme.blue,
                                enableInteractiveSelection: true,
                                obscureText: false,
                                style: const TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AppTheme.dark,
                                ),
                                autofocus: false,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Your last name',
                                  hintStyle: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.light,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Title02(text: 'Date of birth'),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      BottomDialog.showDateTime(
                        context,
                        (data) {
                          setState(() {
                            birthDate = data;
                          });
                        },
                        birthDate,
                      );
                    },
                    child: Container(
                      height: 44,
                      width: MediaQuery.of(context).size.width - 32,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppTheme.lightTwo,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 75,
                            spreadRadius: 0,
                            color: const Color(0xFF939393).withOpacity(0.07),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/schedule.svg',
                            height: 16,
                            width: 16,
                            color: AppTheme.dark,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            (birthDate.day.toString().length == 1
                                    ? '0' + birthDate.day.toString()
                                    : birthDate.day.toString()) +
                                '/' +
                                (birthDate.month.toString().length == 1
                                    ? '0' + birthDate.month.toString()
                                    : birthDate.month.toString()) +
                                '/' +
                                birthDate.year.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: AppTheme.fontFamily,
                              color: AppTheme.dark,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: AppTheme.light,
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
                  setState(() {
                    _isLoading = true;
                  });
                  _saveBasicInfo(
                    _firstNameController.text.replaceAll(' ', ''),
                    _lastNameController.text.replaceAll(' ', ''),
                    birthDate,
                  );
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: MainButton(
                  text: 'Sign in',
                  onHover: onHover,
                  onLoading: _isLoading,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _saveBasicInfo(
    String firstName,
    String lastName,
    DateTime birthDate,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String date = birthDate.toString();
    if (birthDate != DateTime.now() ||
        firstName.isNotEmpty ||
        lastName.isNotEmpty) {
      prefs.setString('firstName', firstName);
      prefs.setString('lastName', lastName);
      prefs.setString('birthDate', date);
      prefs.setBool('isWelcome', true);
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        ),
      );
    } else {
      BottomDialog.showFailed(
        context,
        'Action Failed',
        'Please fill up all required forms',
      );
    }
  }
}
