import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samedu/src/defaults/defaults.dart';
import 'package:samedu/src/ui/menu/home/all_lessons_screen.dart';
import 'package:samedu/src/ui/menu/main_screen.dart';
import 'package:samedu/src/ui/menu/news/news_list_screen.dart';

import '../../theme/app_theme.dart';
import '../../ui/menu/home/teachers_screen.dart';

class HomeDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final String name;
  final String email;
  final String img;

  const HomeDrawer({
    Key? key,
    required this.name,
    required this.email,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppTheme.blue,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: img,
              firstName: name,
              lastName: email,
              onClicked: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'All Lessons',
                    icon: 'assets/icons/schedule.svg',
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'News',
                    icon: 'assets/icons/news.svg',
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Teachers',
                    icon: 'assets/icons/account.svg',
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: AppTheme.white.withOpacity(0.7)),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Support',
                    icon: 'assets/icons/promo.svg',
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Back',
                    icon: "assets/icons/left.svg",
                    onClicked: () => selectedItem(context, 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String firstName,
    required String lastName,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(
            const EdgeInsets.symmetric(vertical: 40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(img),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: AppTheme.fontFamily,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: AppTheme.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lastName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: AppTheme.fontFamily,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required String icon,
    VoidCallback? onClicked,
  }) {
    const color = AppTheme.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: SvgPicture.asset(
        icon,
        color: AppTheme.white,
        height: 24,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: AppTheme.fontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 14,
          height: 1.5,
          color: color,
        ),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AllLessonsScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewsListScreen(news: Defaults().news),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const TeachersScreen(),
        ));
        break;
      case 3:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => DoctorsScreen(),
        // ));
        break;
      case 4:
        break;
    }
  }
}
