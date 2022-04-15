import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samedu/src/theme/app_theme.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'View all',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: AppTheme.fontFamily,
            height: 1.5,
            color: AppTheme.orange,
          ),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          'assets/icons/right.svg',
          height: 16,
          width: 16,
          color: AppTheme.orange,
        ),
      ],
    );
  }
}
