import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samedu/src/defaults/defaults.dart';
import 'package:samedu/src/dialog/bottom_dialog.dart';
import 'package:samedu/src/model/schedule_model.dart';
import 'package:samedu/src/theme/app_theme.dart';
import 'package:samedu/src/ui/menu/news/news_details_screen.dart';
import 'package:samedu/src/ui/menu/news/news_list_screen.dart';
import 'package:samedu/src/widgets/news_container.dart';
import 'package:samedu/src/widgets/title/title_01.dart';
import 'package:samedu/src/widgets/title/view_all.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _firstName = '';
  String _lastName = '';

  // String _myImage = '';
  late ScheduleModel schedule;
  late String lessonStatus;

  @override
  void initState() {
    _getInfo();
    if (DateTime.now().weekday == 7) {
      schedule = Defaults().schedules[0][0];
      lessonStatus = 'Upcoming';
    } else if (DateTime.now().hour <=
        int.parse(Defaults()
            .schedules[DateTime.now().weekday - 1]
            .last
            .end
            .split(':')
            .last)) {
      schedule = Defaults().schedules[DateTime.now().weekday - 1].firstWhere(
        (element) {
          int hour = int.parse(element.end.split(':').toList()[0]);
          return DateTime.now().hour <= hour;
        },
      );
      DateTime.now().hour < int.parse(schedule.end.split(':').toList()[0])
          ? lessonStatus = 'Upcoming'
          : lessonStatus = 'Ongoing';
    } else if (DateTime.now().weekday == 6) {
      schedule = Defaults().schedules[0].first;
      lessonStatus = 'Upcoming';
    } else {
      schedule = Defaults().schedules[DateTime.now().weekday].first;
      lessonStatus = 'Upcoming';
    }
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
                                  _firstName + ' ' + _lastName,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      lessonStatus + ' Lesson',
                                      style: const TextStyle(
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
                                        color: AppTheme.orange,
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
                                          fontSize: 22,
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
                                    const Text(
                                      'Teacher:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontFamily: AppTheme.fontFamily,
                                        height: 1.5,
                                        color: AppTheme.dark,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: () => BottomDialog.showAvatar(
                                        context,
                                        schedule.teacher.avatar,
                                      ),
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 28,
                                              width: 28,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppTheme.lightTwo,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(28),
                                                child: Image.asset(
                                                  schedule.teacher.avatar,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
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
                        children: [
                          const SizedBox(width: 24),
                          const Title01(text: 'News'),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NewsListScreen(news: Defaults().news),
                                ),
                              );
                            },
                            child: const ViewAll(),
                          ),
                          const SizedBox(width: 24),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NewsDetailsScreen(news: item),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  NewsContainer(
                                    img: item.images[0],
                                    title: item.title,
                                  ),
                                  const SizedBox(width: 20),
                                ],
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

  Future<void> _getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // _myImage = prefs.getString('avatar') ?? '';
      _firstName = prefs.getString('firstName') ?? 'Unnamed';
      _lastName = prefs.getString('lastName') ?? '';
    });
  }
}
