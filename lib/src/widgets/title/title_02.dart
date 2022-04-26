import 'package:flutter/cupertino.dart';
import 'package:samedu/src/theme/app_theme.dart';

class Title02 extends StatelessWidget {
  final String text;
  final Color color;

  const Title02({
    Key? key,
    required this.text,
    this.color = AppTheme.gray,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppTheme.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        color: color,
      ),
    );
  }
}
