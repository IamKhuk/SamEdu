import 'package:flutter/material.dart';
import 'package:samedu/src/model/lesson_model.dart';
import '../../dialog/bottom_dialog.dart';
import '../../theme/app_theme.dart';

class LessonContainer extends StatelessWidget {
  final LessonModel lesson;

  const LessonContainer({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppTheme.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 20,
            spreadRadius: 0,
            color: AppTheme.dark.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lesson.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: AppTheme.fontFamily,
              height: 1.5,
              color: AppTheme.blue,
            ),
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
                  lesson.teacher.avatar,
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
                          borderRadius: BorderRadius.circular(28),
                          child: Image.asset(
                            lesson.teacher.avatar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        lesson.teacher.fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.5,
                          color: AppTheme.dark,
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
    );
  }
}
