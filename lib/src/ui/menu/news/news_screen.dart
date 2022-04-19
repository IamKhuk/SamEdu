import 'package:flutter/material.dart';
import 'package:samedu/src/defaults/defaults.dart';

import '../../../theme/app_theme.dart';
import 'news_details_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.bg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'News and Events',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: AppTheme.fontFamily,
            height: 1.5,
            color: AppTheme.dark,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: Defaults().news.length,
        padding: const EdgeInsets.only(
          left: 24,
          top: 4,
          bottom: 24,
          right: 24,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NewsDetailsScreen(news: Defaults().news[index]),
                ),
              );
            },
            child: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 184,
                  width: MediaQuery.of(context).size.width-48,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 146,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            Defaults().news[index].images[0],
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
                              Defaults().news[index].title,
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
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
