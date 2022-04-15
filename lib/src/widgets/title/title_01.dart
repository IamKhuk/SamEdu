import 'package:flutter/cupertino.dart';
import 'package:samedu/src/theme/app_theme.dart';

class Title01 extends StatelessWidget {
  final String text;

  const Title01({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppTheme.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        height: 1.5,
        color: AppTheme.dark,
      ),
    );
  }
}
