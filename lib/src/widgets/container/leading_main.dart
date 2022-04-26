import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeadingMain extends StatelessWidget {
  final String svg;

  const LeadingMain({
    Key? key,
    required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(44),
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.transparent,
          height: 44,
          width: 44,
          child: Center(
            child: SvgPicture.asset(svg),
          ),
        ),
      ),
    );
  }
}
