import 'package:flutter/material.dart';
import 'package:samedu/src/defaults/defaults.dart';
import 'package:samedu/src/theme/app_theme.dart';
import 'package:samedu/src/widgets/container/leading_main.dart';
import 'package:samedu/src/widgets/container/settings_container.dart';
import 'package:samedu/src/widgets/title/heading_01.dart';
import 'package:samedu/src/widgets/title/text_01.dart';
import 'package:samedu/src/widgets/title/title_01.dart';
import 'package:samedu/src/widgets/title/title_02.dart';
import 'package:samedu/src/widgets/title/view_all.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        leadingWidth: 60,
        leading: const LeadingMain(
          svg: 'assets/icons/menu_04.svg',
        ),
        title: const Heading01(text: 'Profile'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppTheme.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: AppTheme.dark.withOpacity(0.4),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 116,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/me.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Heading01(
                      text: Defaults().me.firstName,
                    ),
                    const SizedBox(height: 4),
                    Heading01(
                      text: Defaults().me.lastName,
                    ),
                    const SizedBox(height: 4),
                    Text01(text: Defaults().me.bio),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 214,
                        decoration: const BoxDecoration(
                          color: AppTheme.blue,
                        ),
                        child: const Center(
                          child: Title02(
                            text: 'Edit Profile',
                            color: AppTheme.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              const Expanded(
                child: Title01(text: 'Settings'),
              ),
              GestureDetector(
                child: const ViewAll(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const SettingsContainer(
            img: 'assets/icons/lock.svg',
            title: 'Privacy & Security',
          ),
          const SizedBox(height: 16),
          const SettingsContainer(
            img: 'assets/icons/promo.svg',
            title: 'Denote',
          ),
          const SizedBox(height: 16),
          const SettingsContainer(
            img: 'assets/icons/help.svg',
            title: 'Help',
          ),
          const SizedBox(height: 16),
          const SettingsContainer(
            img: 'assets/icons/log_out.svg',
            title: 'Logout',
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
