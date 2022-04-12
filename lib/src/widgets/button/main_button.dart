import 'package:flutter/material.dart';
import 'package:samedu/src/theme/app_theme.dart';

class MainButton extends StatefulWidget {
  final String text;
  final bool onHover;
  final bool onLoading;

  const MainButton({
    Key? key,
    required this.text,
    required this.onHover,
    required this.onLoading,
  }) : super(key: key);

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: widget.onHover == true ? AppTheme.lightTwo : AppTheme.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: widget.onLoading == false
            ? Text(
                widget.text,
                style: const TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  color: AppTheme.white,
                ),
              )
            : const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.white),
              ),
      ),
    );
  }
}
