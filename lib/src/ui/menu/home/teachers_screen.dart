import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samedu/src/widgets/container/leading_main.dart';

import '../../../defaults/defaults.dart';
import '../../../dialog/bottom_dialog.dart';
import '../../../theme/app_theme.dart';

class TeachersScreen extends StatefulWidget {
  const TeachersScreen({Key? key}) : super(key: key);

  @override
  _TeachersScreenState createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
        leading: const LeadingBack(),
        centerTitle: true,
        title: const Text(
          'Teachers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: AppTheme.fontFamily,
            height: 1.5,
            color: AppTheme.dark,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: ListView.builder(
        itemCount: Defaults().teachers.length,
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 48,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppTheme.blue,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 20,
                      spreadRadius: 0,
                      color: AppTheme.dark.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => BottomDialog.showAvatar(
                        context,
                        Defaults().teachers[index].avatar,
                      ),
                      child: SizedBox(
                        height: 48,
                        width: 48,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(64),
                          child: Image.asset(
                            Defaults().teachers[index].avatar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        Defaults().teachers[index].fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.5,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              index == Defaults().teachers.length - 1
                  ? Container()
                  : const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
