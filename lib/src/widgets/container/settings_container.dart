import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_theme.dart';

class SettingsContainer extends StatelessWidget {
  final String img;
  final String title;

  const SettingsContainer({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            img,
            color: AppTheme.blue,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: AppTheme.fontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.5,
                color: AppTheme.dark,
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/icons/right.svg',
            color: AppTheme.dark,
          ),
        ],
      ),
    );
  }
}
