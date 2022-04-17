import 'package:flutter/cupertino.dart';
import 'package:samedu/src/theme/app_theme.dart';

class Title03 extends StatelessWidget {
  final String text;

  const Title03({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppTheme.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: AppTheme.blue,
      ),
    );
  }
}
