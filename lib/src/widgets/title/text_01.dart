import 'package:flutter/cupertino.dart';
import 'package:samedu/src/theme/app_theme.dart';

class Text01 extends StatelessWidget {
  final String text;

  const Text01({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppTheme.fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: AppTheme.light,
      ),
    );
  }
}
