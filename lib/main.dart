// import 'dart:convert';

import 'package:carrive_app/l10n/app_localizations.dart';
// import 'package:carrive_app/src/data/models/user.dart';
// import 'package:carrive_app/src/presentation/root/root_screen.dart';
// import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/presentation/screens/splash_screen.dart';

Future<void> main() async {
  // This is to ensure that the app's orientation stays portrait
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        // User user = User(
        //   id: "0000000000",
        //   name: "Jubal Prospère",
        //   email: "jubalprospere@gmail.com",
        //   token: "090395039350953093095",
        //   isActive: true,
        //   isConnected: true,
        //   isRegister: true,
        //   userType: UserType.driver,
        // );
        // Convert User object to JSON and save to SharedPreferences
        // final userJson = jsonEncode(user.toJson());
        // print(userJson);

        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // To choose the locale we are using
          locale: const Locale('fr'),
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),

          // home: RootScreen(user: user),
        );
      },
    );
  }
}
