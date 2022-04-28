import 'package:flutter/cupertino.dart';

import '../../theme/app_theme.dart';

class NewsContainer extends StatelessWidget {
  final String img;
  final String title;

  const NewsContainer({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 184,
      width: MediaQuery.of(context).size.width-92,
      child: Stack(
        children: [
          SizedBox(
            height: 146,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                img,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: 146,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppTheme.lightTwo,
                  AppTheme.lightTwo.withOpacity(0.7),
                  AppTheme.lightTwo.withOpacity(0.4),
                  AppTheme.lightTwo.withOpacity(0.1),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: AppTheme.dark.withOpacity(0.1),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: AppTheme.dark,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              // const SizedBox(height: 8),
            ],
          )
        ],
      ),
    );
  }
}
