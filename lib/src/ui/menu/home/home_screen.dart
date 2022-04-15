import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samedu/src/defaults/defaults.dart';
import 'package:samedu/src/model/schedule_model.dart';
import 'package:samedu/src/theme/app_theme.dart';
import 'package:samedu/src/widgets/title/title_01.dart';
import 'package:samedu/src/widgets/title/view_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstName = 'Khusan';
  String lastName = 'Khukumov';
  late ScheduleModel schedule;

  @override
  void initState() {
    schedule = Defaults().schedules[DateTime.now().weekday - 1][0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.blue,
        elevation: 0,
        leadingWidth: 64,
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
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: 55,
                        color: AppTheme.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 24),
                                Text(
                                  'Welcome back',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    fontFamily: AppTheme.fontFamily,
                                    height: 1.5,
                                    color: AppTheme.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 24),
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
                          ],
                        ),
                      ),
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
                          Container(
                            width: MediaQuery.of(context).size.width - 48,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppTheme.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Ongoing Lesson',
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontFamily,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        color: AppTheme.green,
                                      ),
                                    ),
                                    Text(
                                      schedule.room + ' room',
                                      style: const TextStyle(
                                        fontFamily: AppTheme.fontFamily,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5,
                                        color: AppTheme.dark,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        schedule.subject,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                          fontFamily: AppTheme.fontFamily,
                                          height: 1.5,
                                          color: AppTheme.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Container(
                                      height: 28,
                                      width: 28,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.lightTwo,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(28),
                                        child: Image.asset(
                                          schedule.teacher.avatar,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      schedule.teacher.fullName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        fontFamily: AppTheme.fontFamily,
                                        height: 1.5,
                                        color: AppTheme.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: const [
                          SizedBox(width: 24),
                          Title01(text: 'News'),
                          Spacer(),
                          ViewAll(),
                          SizedBox(width: 24),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 184,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          items: Defaults().news.map((item) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return AdviceSingleScreen(
                                //         index: advices.indexOf(item),
                                //         title: 'Treatment',
                                //       );
                                //     },
                                //   ),
                                // );
                              },
                              child: Container(
                                height: 184,
                                margin: const EdgeInsets.only(right: 20),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: 146,
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          item.images[0],
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 146,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            AppTheme.lightTwo,
                                            AppTheme.lightTwo.withOpacity(0.7),
                                            AppTheme.lightTwo.withOpacity(0.4),
                                            AppTheme.lightTwo.withOpacity(0.1),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppTheme.white,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            item.title,
                                            style: const TextStyle(
                                              fontFamily: AppTheme.fontFamily,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5,
                                              color: AppTheme.dark,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        // const SizedBox(height: 8),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {},
                            autoPlay: true,
                            scrollDirection: Axis.horizontal,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: false,
                            pauseAutoPlayOnTouch: true,
                            viewportFraction: 0.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
