import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/root/root_screen.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        User user = User(
          id: "0000000000",
          name: "Jubal Prospère",
          email: "jubalprospere@gmail.com",
          token: "090395039350953093095",
          isActive: true,
          isConnected: true,
          isRegister: true,
          userType: UserType.passenger,
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),

          // home: RootScreen(user: user),
        );
      },
    );
  }
}
