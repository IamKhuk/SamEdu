import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samedu/src/defaults/defaults.dart';
import 'package:samedu/src/theme/app_theme.dart';
import 'package:samedu/src/utils/utils.dart';

import '../../../dialog/bottom_dialog.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late List<DateTime> dateList;
  int selectedDate = 0;
  int selectedWeekDay = DateTime.now().weekday;

  @override
  void initState() {
    dateList = Utils.dateListFormat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.bg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Schedule',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: AppTheme.fontFamily,
            height: 1.5,
            color: AppTheme.dark,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 8,
          top: 16,
        ),
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dateList.first.day.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 44,
                        fontFamily: AppTheme.fontFamily,
                        height: 1.5,
                        color: AppTheme.dark,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Utils.weekDayFormat(dateList.first),
                          style: const TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppTheme.light,
                          ),
                        ),
                        Text(
                          Utils.monthFormat(dateList.first) +
                              ' ' +
                              dateList.first.year.toString(),
                          style: const TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppTheme.light,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppTheme.orange,
                ),
                child: const Center(
                  child: Text(
                    'Today',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: AppTheme.fontFamily,
                      height: 1.5,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: dateList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = index;
                      selectedWeekDay = dateList[index].weekday;
                    });
                  },
                  child: Container(
                    height: 60,
                    width: (MediaQuery.of(context).size.width - 120) / 7,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: selectedDate == index
                          ? AppTheme.blue
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Utils.weekFormat(dateList[index]),
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: selectedDate == index
                                  ? AppTheme.white
                                  : AppTheme.light,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            dateList[index].day.toString(),
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: selectedDate == index
                                  ? AppTheme.white
                                  : AppTheme.dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
          Container(
            width: MediaQuery.of(context).size.width - 16,
            padding: const EdgeInsets.only(
              top: 26,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppTheme.lightTwo,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Time',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: AppTheme.fontFamily,
                        height: 1.5,
                        color: AppTheme.dark,
                      ),
                    ),
                    const SizedBox(width: 36),
                    const Text(
                      'Lesson',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: AppTheme.fontFamily,
                        height: 1.5,
                        color: AppTheme.dark,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/icons/sort_down.svg'),
                  ],
                ),
                const SizedBox(height: 12),
                selectedWeekDay != 7
                    ? ListView.builder(
                        itemCount:
                            Defaults().schedules[selectedWeekDay - 1].length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(bottom: 72),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          int ongoing = 0;
                          return Container(
                            margin: const EdgeInsets.only(top: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Defaults()
                                          .schedules[selectedWeekDay - 1][index]
                                          .start,
                                      style: const TextStyle(
                                          fontFamily: AppTheme.fontFamily,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                          color: AppTheme.dark),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      Defaults()
                                          .schedules[selectedWeekDay - 1][index]
                                          .end,
                                      style: const TextStyle(
                                        fontFamily: AppTheme.fontFamily,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        color: AppTheme.dark,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 52,
                                  width: 1,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  color: AppTheme.light,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: index == ongoing
                                          ? AppTheme.blue
                                          : AppTheme.light,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          Defaults()
                                                  .schedules[selectedWeekDay -
                                                      1][index]
                                                  .room +
                                              ' room',
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontFamily,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            height: 1.5,
                                            color: index == ongoing
                                                ? AppTheme.white
                                                : AppTheme.dark,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                Defaults()
                                                    .schedules[selectedWeekDay -
                                                        1][index]
                                                    .subject,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      AppTheme.fontFamily,
                                                  height: 1.5,
                                                  color: index == ongoing
                                                      ? AppTheme.white
                                                      : AppTheme.dark,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () =>
                                                  BottomDialog.showAvatar(
                                                context,
                                                Defaults()
                                                    .schedules[selectedWeekDay -
                                                        1][index]
                                                    .teacher
                                                    .avatar,
                                              ),
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 28,
                                                      width: 28,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            AppTheme.lightTwo,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(28),
                                                        child: Image.asset(
                                                          Defaults()
                                                              .schedules[
                                                                  selectedWeekDay -
                                                                      1][index]
                                                              .teacher
                                                              .avatar,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      Defaults()
                                                          .schedules[
                                                              selectedWeekDay -
                                                                  1][index]
                                                          .teacher
                                                          .fullName,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 12,
                                                        fontFamily:
                                                            AppTheme.fontFamily,
                                                        height: 1.5,
                                                        color: index == ongoing
                                                            ? AppTheme.white
                                                            : AppTheme.dark,
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
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : SizedBox(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                top: 16,
                                left: 24,
                                right: 24,
                                bottom: 16,
                              ),
                              margin: const EdgeInsets.symmetric(
                                vertical: 24,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.light,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      'There is no lessons in this day',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppTheme.fontFamily,
                                        fontSize: 14,
                                        height: 1.5,
                                        color: AppTheme.dark,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
