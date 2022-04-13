import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samedu/src/ui/splash/splash_screen.dart';

bool isLoginPage = false;
String token = "";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.transparent,
        platform: TargetPlatform.iOS,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF818C99),
          brightness: Brightness.dark,
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      home: const SplashScreen(),
    );
  }
}
