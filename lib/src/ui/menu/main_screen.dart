import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samedu/src/theme/app_theme.dart';
import 'package:samedu/src/ui/menu/news/news_screen.dart';
import 'package:samedu/src/ui/menu/profile/profile_screen.dart';
import 'package:samedu/src/ui/menu/schedule/schedule_screen.dart';
import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> data = [
    const HomeScreen(),
    const ScheduleScreen(),
    const NewsScreen(),
    const ProfileScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: Stack(
        children: [
          data[selectedIndex],
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height: 56,
              width: size.width,
              margin: const EdgeInsets.only(
                left: 36,
                bottom: 24,
                right: 36,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/home.svg',
                            color: selectedIndex == 0
                                ? AppTheme.blue
                                : AppTheme.lightTwo,
                          ),
                          selectedIndex == 0
                              ? Column(
                            children: [
                              const SizedBox(height: 4),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(6),
                                  color: AppTheme.blue,
                                ),
                              ),
                            ],
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/schedule.svg',
                            color: selectedIndex == 1
                                ? AppTheme.blue
                                : AppTheme.lightTwo,
                          ),
                          selectedIndex == 1
                              ? Column(
                            children: [
                              const SizedBox(height: 4),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(6),
                                  color: AppTheme.blue,
                                ),
                              ),
                            ],
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/message.svg',
                            color: selectedIndex == 2
                                ? AppTheme.blue
                                : AppTheme.lightTwo,
                          ),
                          selectedIndex == 2
                              ? Column(
                            children: [
                              const SizedBox(height: 4),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(6),
                                  color: AppTheme.blue,
                                ),
                              ),
                            ],
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/account.svg',
                            color: selectedIndex == 3
                                ? AppTheme.blue
                                : AppTheme.lightTwo,
                          ),
                          selectedIndex == 3
                              ? Column(
                            children: [
                              const SizedBox(height: 4),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(6),
                                  color: AppTheme.blue,
                                ),
                              ),
                            ],
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
