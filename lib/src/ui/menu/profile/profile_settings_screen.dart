import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samedu/src/defaults/defaults.dart';
import 'package:samedu/src/theme/app_theme.dart';
import 'package:samedu/src/widgets/container/leading_main.dart';
import 'package:samedu/src/widgets/title/heading_01.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../../dialog/bottom_dialog.dart';
import '../../../widgets/button/main_button.dart';
import '../../../widgets/title/title_02.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  DateTime birthDate = DateTime.now();
  bool onHover = true;
  bool _isLoading = false;

  @override
  void initState() {
    _getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        birthDate != DateTime.now()) {
      setState(() {
        onHover = false;
      });
    } else {
      setState(() {
        onHover = true;
      });
    }
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0,
        leading: const LeadingBack(),
        title: const Heading01(text: 'Edit Profile'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Title02(text: 'First name'),
                          const SizedBox(height: 12),
                          Container(
                            height: 44,
                            width: (MediaQuery.of(context).size.width - 64) / 2,
                            decoration: BoxDecoration(
                              color: AppTheme.lightTwo,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 7),
                                  blurRadius: 55,
                                  spreadRadius: 0,
                                  color:
                                      const Color(0xFF939393).withOpacity(0.07),
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
                                controller: firstNameController,
                                enableSuggestions: true,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor: AppTheme.blue,
                                enableInteractiveSelection: true,
                                obscureText: false,
                                style: const TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AppTheme.dark,
                                ),
                                autofocus: false,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Your first name',
                                  hintStyle: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.light,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Title02(text: 'Last name'),
                          const SizedBox(height: 12),
                          Container(
                            height: 44,
                            width: (MediaQuery.of(context).size.width - 64) / 2,
                            decoration: BoxDecoration(
                              color: AppTheme.lightTwo,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 7),
                                  blurRadius: 55,
                                  spreadRadius: 0,
                                  color:
                                      const Color(0xFF939393).withOpacity(0.07),
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
                                controller: lastNameController,
                                enableSuggestions: true,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor: AppTheme.blue,
                                enableInteractiveSelection: true,
                                obscureText: false,
                                style: const TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AppTheme.dark,
                                ),
                                autofocus: false,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Your last name',
                                  hintStyle: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.light,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Title02(text: 'Date of birth'),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      BottomDialog.showDateTime(
                        context,
                        (data) {
                          setState(() {
                            birthDate = data;
                          });
                        },
                        birthDate,
                      );
                    },
                    child: Container(
                      height: 44,
                      width: MediaQuery.of(context).size.width - 32,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppTheme.lightTwo,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 75,
                            spreadRadius: 0,
                            color: const Color(0xFF939393).withOpacity(0.07),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/schedule.svg',
                            height: 16,
                            width: 16,
                            color: AppTheme.dark,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            (birthDate.day.toString().length == 1
                                    ? '0' + birthDate.day.toString()
                                    : birthDate.day.toString()) +
                                '/' +
                                (birthDate.month.toString().length == 1
                                    ? '0' + birthDate.month.toString()
                                    : birthDate.month.toString()) +
                                '/' +
                                birthDate.year.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: AppTheme.fontFamily,
                              color: AppTheme.dark,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Title02(text: 'Bio'),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppTheme.lightTwo,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 75,
                          spreadRadius: 0,
                          color: const Color(0xFF939393).withOpacity(0.07),
                        ),
                      ],
                    ),
                    child: TextField(
                      enabled: true,
                      maxLines: 5,
                      controller: bioController,
                      enableSuggestions: true,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: AppTheme.blue,
                      enableInteractiveSelection: true,
                      style: const TextStyle(
                        fontFamily: AppTheme.fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: AppTheme.dark,
                      ),
                      autofocus: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write a bio...',
                        hintStyle: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: AppTheme.light,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Title02(text: 'Faculty'),
                  const SizedBox(height: 12),
                  Container(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 32,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppTheme.lightTwo,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 75,
                          spreadRadius: 0,
                          color: const Color(0xFF939393).withOpacity(0.07),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'International Education Programs',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: AppTheme.fontFamily,
                            color: AppTheme.dark,
                            height: 1.5,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Title02(text: 'Major'),
                  const SizedBox(height: 12),
                  Container(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 32,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppTheme.lightTwo,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 75,
                          spreadRadius: 0,
                          color: const Color(0xFF939393).withOpacity(0.07),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Computer Science',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: AppTheme.fontFamily,
                            color: AppTheme.dark,
                            height: 1.5,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: AppTheme.light,
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: Platform.isIOS ? 32 : 24,
                left: 24,
                right: 24,
                top: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isLoading = true;
                  });
                  _savePersonalInfo(
                    firstNameController.text.replaceAll(' ', ''),
                    lastNameController.text.replaceAll(' ', ''),
                    birthDate,
                    bioController.text,
                  );
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: MainButton(
                  text: 'Save changes',
                  onHover: onHover,
                  onLoading: _isLoading,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _savePersonalInfo(
    String firstName,
    String lastName,
    DateTime birthDate,
    String bio,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String date = birthDate.day.toString() +
        '/' +
        birthDate.month.toString() +
        '/' +
        birthDate.year.toString();
    if (birthDate != DateTime.now() ||
        firstName.isNotEmpty ||
        lastName.isNotEmpty) {
      prefs.setString('firstName', firstName);
      prefs.setString('lastName', lastName);
      prefs.setString('birthDate', date);
      prefs.setString('bio', bio);
      Navigator.pop(context);
    } else {
      BottomDialog.showFailed(
        context,
        'Action Failed',
        'Please fill up all required forms',
      );
    }
  }

  Future<void> _getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String date = prefs.getString('birthDate') ?? '01/01/2000';
    List<int> list = date.split('/').map(int.parse).toList();
    DateTime _birthDate = DateTime(list[2], list[1], list[0]);
    setState(() {
      firstNameController.text = prefs.getString('firstName') ?? 'No name';
      lastNameController.text = prefs.getString('lastName') ?? 'No nome';
      birthDate = _birthDate;
      bioController.text = prefs.getString('bio')?? Defaults().me.bio;
    });
  }
}
