import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../theme/app_theme.dart';
import '../auth/login_screen.dart';
import '../menu/main_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? offset;

  @override
  void initState() {
    _nextScreen();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1270),
    )..forward();
    offset = Tween<Offset>(
      begin: const Offset(0.0, 4.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blue,
      body: Stack(
        children: [
          Column(
            children: [
              SvgPicture.asset(
                'assets/icons/splash_up.svg',
                color: AppTheme.light.withOpacity(0.7),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/splash_down.svg',
                color: AppTheme.light.withOpacity(0.7),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LOADING',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: AppTheme.fontFamily,
                        letterSpacing: 0.14,
                        color: AppTheme.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: SlideTransition(
              position: offset!,
              child: SizedBox(
                height: 158,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo_white.png',
                      height: 108,
                      width: 108,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'SamEdu',
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamily,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Future<void> _setLanguage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var lan = prefs.getString('language') ?? "uz";
  //   var localizationDelegate = LocalizedApp.of(context).delegate;
  //   localizationDelegate.changeLocale(Locale(lan));
  // }

  _nextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("firstOpen") != null) {
      isLoginPage = true;
    } else {
      prefs.setString("firstOpen", "value");
      isLoginPage = false;
    }
    token = prefs.getString('token') ?? "";

    Timer(
      const Duration(milliseconds: 2270),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return isLoginPage == false
                  ? const OnBoardingScreen()
                  : token == ""
                      ? const LoginScreen()
                      : const MainScreen();
            },
          ),
        );
      },
    );
  }
}
