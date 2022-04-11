import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_theme.dart';
import '../menu/main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLoading = false;
  final PageController _pageController = PageController();
  final List<String> _images = [
    "assets/images/onboarding_01.svg",
    "assets/images/onboarding_02.svg",
    "assets/images/onboarding_03.svg",
  ];
  int _selectedIndex = 0;
  List<String> title = [
    'Check Your Lessons',
    'Connect to the World',
    'Safe and Secure',
  ];
  List<String> msg = [
    'Check your ongoing lessons and learning process anytime, anywhere',
    'Connect with the university, teachers and students just in your phone.',
    'Messages, actions are secured\nYour information is safe!.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Theme(
              data: ThemeData(
                platform: TargetPlatform.android,
              ),
              child: PageView.builder(
                itemCount: _images.length,
                controller: _pageController,
                allowImplicitScrolling: false,
                onPageChanged: (_index) {
                  setState(() {
                    _selectedIndex = _index;
                  });
                },
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Column(
                      children: [
                        const SizedBox(height: 56),
                        _selectedIndex != 2
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _selectedIndex = 2;
                                      });
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Skip',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              fontFamily: AppTheme.fontFamily,
                                              height: 1.71,
                                              color: AppTheme.blue,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          SvgPicture.asset(
                                            'assets/icons/right.svg',
                                            height: 16,
                                            width: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(height: 24),
                        SvgPicture.asset(
                          _images[index],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title[_selectedIndex],
                  style: const TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: AppTheme.dark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  msg[_selectedIndex],
                  style: const TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: AppTheme.light,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 56,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 270),
                              height: 9,
                              width: _selectedIndex == 0 ? 28 : 9,
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(
                                color: _selectedIndex == 0
                                    ? AppTheme.blue
                                    : AppTheme.gray.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            const SizedBox(width: 16),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 270),
                              height: 9,
                              width: _selectedIndex == 1 ? 28 : 9,
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(
                                color: _selectedIndex == 1
                                    ? AppTheme.blue
                                    : AppTheme.gray.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            const SizedBox(width: 16),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 270),
                              height: 9,
                              width: _selectedIndex == 2 ? 28 : 9,
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(
                                color: _selectedIndex == 2
                                    ? AppTheme.blue
                                    : AppTheme.gray.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_selectedIndex < 2) {
                            _pageController.animateToPage(
                              _pageController.page!.toInt() + 1,
                              duration: const Duration(milliseconds: 270),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const MainScreen();
                                },
                              ),
                            );
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(56),
                            color: AppTheme.blue,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                _selectedIndex == 0 || _selectedIndex == 1
                                    ? 55
                                    : 45,
                          ),
                          child: Center(
                            child: isLoading == false
                                ? Text(
                                    _selectedIndex == 0
                                        ? 'Next'
                                        : _selectedIndex == 1
                                            ? 'Next'
                                            : 'Get Started',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: AppTheme.fontFamily,
                                      color: AppTheme.white,
                                      height: 25 / 18,
                                    ),
                                  )
                                : const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppTheme.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
