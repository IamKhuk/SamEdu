import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:samedu/src/ui/menu/home/basic_screen.dart';
import 'package:samedu/src/widgets/button/main_button.dart';
import '../../theme/app_theme.dart';
import 'login_screen.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  final String password;

  const VerificationScreen({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _pinPutFocusNode = FocusNode();
  final _pinPutController = TextEditingController();
  bool _isLoading = false;
  int timer = 120;
  Timer? _timer;
  String? code;
  bool onHover = true;

  void codeUpdated() {
    setState(() {
      _pinPutController.text = code!;
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: AppTheme.white,
    borderRadius: BorderRadius.circular(4),
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 4),
        color: const Color(0xFF000000).withOpacity(0.09),
        blurRadius: 20,
        spreadRadius: 0,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
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
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  const SizedBox(height: 56),
                  Row(
                    children: const [
                      Spacer(),
                      Text(
                        'Verify',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.44,
                          color: AppTheme.dark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Enter the 4 digits code that you received on your email so you can complete sign up process. (Please check spam mails if you cannot get the mail)',
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppTheme.gray,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  timer > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              timer.toString() + ' sec.',
                              style: const TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                                height: 1.8,
                                color: AppTheme.dark,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: PinPut(
                      eachFieldWidth: 48,
                      eachFieldHeight: 48,
                      withCursor: false,
                      fieldsCount: 4,
                      onSubmit: (String pin) {
                        _initPinPut(pin);
                      },
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: pinPutDecoration,
                      selectedFieldDecoration: pinPutDecoration,
                      followingFieldDecoration: pinPutDecoration,
                      pinAnimationType: PinAnimationType.scale,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppTheme.fontFamily,
                        height: 1.4,
                        color: AppTheme.dark,
                      ),
                    ),
                  ),
                  timer == 0
                      ? Column(
                          children: [
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Did not get the code? ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.5,
                                    fontFamily: AppTheme.fontFamily,
                                    color: AppTheme.gray,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      timer = 120;
                                    });
                                    _startTimer();
                                  },
                                  child: const Text(
                                    'Send Again',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      height: 1.5,
                                      fontFamily: AppTheme.fontFamily,
                                      color: AppTheme.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(height: 44),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: Platform.isIOS ? 32 : 24,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).popUntil(
                    (route) => route.isFirst,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const BasicScreen();
                      },
                    ),
                  );
                },
                child: MainButton(
                  text: 'Done',
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

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        timer--;
        if (timer == 0) {
          _timer!.cancel();
        }
        setState(() {});
      },
    );
  }

  Future<void> _initPinPut(String pin) async {
    setState(() {
      _isLoading = true;
      onHover = true;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const BasicScreen();
        },
      ),
    );
  }
}
