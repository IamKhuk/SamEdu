import 'package:flutter/cupertino.dart';
import 'package:samedu/src/theme/app_theme.dart';

class Heading01 extends StatelessWidget {
  final String text;

  const Heading01({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: AppTheme.fontFamily,
        height: 1.5,
        color: AppTheme.dark,
      ),
    );
  }
}
