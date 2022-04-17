import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samedu/src/model/news_model.dart';
import 'package:samedu/src/utils/utils.dart';
import 'package:samedu/src/widgets/title/title_03.dart';

import '../../../theme/app_theme.dart';

class NewsDetailsScreen extends StatefulWidget {
  final NewsModel news;

  const NewsDetailsScreen({Key? key, required this.news}) : super(key: key);

  @override
  _NewsDetailsScreenState createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  bool onLike = false;
  bool onDislike = false;
  bool isLike = true;
  bool isDislike = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: false,
                  ),
                  items: widget.news.images.map(
                    (item) {
                      return SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 188),
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  Utils.newsDateFormat(widget.news.date),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: AppTheme.fontFamily,
                                    height: 1.5,
                                    color: AppTheme.gray,
                                  ),
                                ),
                              ),
                              Text(
                                widget.news.likes.toString(),
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  color: onLike == true
                                      ? AppTheme.blue
                                      : AppTheme.dark,
                                ),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    onLike = true;
                                    if(onDislike == true){
                                      onDislike = false;
                                      widget.news.dislikes--;
                                    }
                                    if(isLike==true){
                                      widget.news.likes++;
                                      isLike = false;
                                    }
                                    isDislike = true;
                                  });
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: SvgPicture.asset(
                                    'assets/icons/like.svg',
                                    color: onLike == true
                                        ? AppTheme.blue
                                        : AppTheme.dark,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                widget.news.dislikes.toString(),
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  color: onDislike == true
                                      ? AppTheme.blue
                                      : AppTheme.dark,
                                ),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    onDislike = true;
                                    if(onLike == true){
                                      onLike = false;
                                      widget.news.likes--;
                                    }
                                    if(isDislike==true){
                                      widget.news.dislikes++;
                                      isDislike = false;
                                    }
                                    isLike = true;
                                  });
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: SvgPicture.asset(
                                    'assets/icons/dislike.svg',
                                    color: onDislike == true
                                        ? AppTheme.blue
                                        : AppTheme.dark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.news.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    fontFamily: AppTheme.fontFamily,
                                    height: 1.5,
                                    color: AppTheme.dark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Title03(text: 'Details'),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.news.text,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: AppTheme.fontFamily,
                                    height: 1.5,
                                    color: AppTheme.gray,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * ((94) / 812),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/left.svg',
                            color: AppTheme.dark,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
