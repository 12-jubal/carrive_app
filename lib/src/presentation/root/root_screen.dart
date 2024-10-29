import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/root/root_cubit.dart';
import 'package:carrive_app/src/presentation/root/root_state.dart';
import 'package:carrive_app/src/presentation/screens/booking/booking_screen.dart';
import 'package:carrive_app/src/presentation/screens/chat/chat_screen.dart';
import 'package:carrive_app/src/presentation/screens/explore/explore_screen.dart';
import 'package:carrive_app/src/presentation/screens/profile/profile_screen.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootScreen extends StatefulWidget {
  final User user;
  const RootScreen({
    required this.user,
    super.key,
  });

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(user: widget.user),
      child: BlocConsumer<RootCubit, RootState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<RootCubit>();
          return Scaffold(
            body: state.item == NavbarItem.explore
                ? ExploreScreen(
                    user: widget.user,
                  )
                : state.item == NavbarItem.chat
                    ? ChatScreen(
                        user: widget.user,
                      )
                    : state.item == NavbarItem.bookings
                        ? BookingScreen(
                            user: widget.user,
                          )
                        : state.item == NavbarItem.profile
                            ? ProfileScreen(
                                user: widget.user,
                              )
                            : ExploreScreen(
                                user: widget.user,
                              ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 2.0,
              currentIndex: state.index,
              selectedItemColor: AppColors.primarySource,
              unselectedItemColor: AppColors.primary_700,
              selectedLabelStyle: AppTextStyles.body3.copyWith(
                color: AppColors.primarySource,
              ),
              showUnselectedLabels: false,
              showSelectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/explore_outlined.svg",
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary_700,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/explore_filled.svg",
                    colorFilter: const ColorFilter.mode(
                      AppColors.primarySource,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "Explore",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/chat_outline.svg",
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary_700,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset("assets/icons/chat_filled.svg",
                      colorFilter: const ColorFilter.mode(
                        AppColors.primarySource,
                        BlendMode.srcIn,
                      )),
                  label: "Chats",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/booking_outlined.svg",
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary_700,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/booking_filled.svg",
                    colorFilter: const ColorFilter.mode(
                      AppColors.primarySource,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "Bookings",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/circled_profile_outlined.svg",
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary_700,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/circled_profile_filled.svg",
                    colorFilter: const ColorFilter.mode(
                      AppColors.primarySource,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "Profile",
                ),
              ],
              onTap: (index) {
                switch (index) {
                  case 0:
                    cubit.getNavBarItem(NavbarItem.explore);
                    break;
                  case 1:
                    cubit.getNavBarItem(NavbarItem.chat);
                    break;
                  case 2:
                    cubit.getNavBarItem(NavbarItem.bookings);
                    break;
                  case 3:
                    cubit.getNavBarItem(NavbarItem.profile);
                    break;
                  default:
                    cubit.getNavBarItem(NavbarItem.explore);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
