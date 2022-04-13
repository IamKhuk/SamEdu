import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_theme.dart';

class TextField01 extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final bool pass;

  const TextField01({
    Key? key,
    required this.controller,
    required this.hint,
    required this.pass,
  }) : super(key: key);

  @override
  _TextField01State createState() => _TextField01State();
}

class _TextField01State extends State<TextField01> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width - 48,
      decoration: BoxDecoration(
        color: AppTheme.lightTwo,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 7),
            blurRadius: 55,
            spreadRadius: 0,
            color: const Color(0xFF939393).withOpacity(0.07),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: TextFormField(
          enabled: true,
          controller: widget.controller,
          enableSuggestions: true,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: AppTheme.blue,
          enableInteractiveSelection: true,
          obscureText: obscure,
          style: const TextStyle(
            fontFamily: AppTheme.fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppTheme.dark,
          ),
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(
              fontFamily: AppTheme.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.light,
            ),
            suffixIcon: widget.pass == true
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 12,
                        bottom: 12,
                      ),
                      child: obscure == false
                          ? SvgPicture.asset(
                              'assets/icons/eye.svg',
                              color: AppTheme.light,
                            )
                          : SvgPicture.asset(
                              'assets/icons/eye_closed.svg',
                              color: AppTheme.blue,
                            ),
                    ),
                  )
                : const SizedBox(width: 16),
          ),
        ),
      ),
    );
  }
}
