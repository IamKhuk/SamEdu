import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samedu/src/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstName = 'Khusan';
  String lastName = 'Khukumov';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.blue,
            pinned: true,
            floating: true,
            snap: false,
            leading: Row(
              children: [
                const SizedBox(width: 24),
                InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/menu.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            expandedHeight: 84,
            elevation: 0,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome back',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    fontFamily: AppTheme.fontFamily,
                    height: 1.5,
                    color: AppTheme.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  firstName + ' ' + lastName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: AppTheme.fontFamily,
                    height: 1.5,
                    color: AppTheme.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: AppTheme.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
