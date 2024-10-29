import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/chat/chat_cubit.dart';
import 'package:carrive_app/src/presentation/logic/chat/chat_state.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/widgets/chat_tile.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatelessWidget {
  final User user;
  const ChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ChatCubit>();
          final locale = AppLocalizations.of(context)!;
          return CustomScreen(
            isLoading: state is ChatLoading,
            loadingMessage: state is ChatLoading ? state.message : '',
            child: Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                      top: 72.h,
                      left: 24.w,
                      right: 24.w,
                      bottom: 10.h,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Column(
                            children: [
                              // Search Text Field
                              CustomTextField(
                                hint: 'Search',
                                onChanged: (value) {},
                                textEditingController:
                                    cubit.searchTextEditingController,
                                suffix: true,
                                suffixIconString: 'assets/icons/search.svg',
                              ),
                              const Spacing(height: 24),
                              // Chat List
                              const ChatTile(
                                hasRead: false,
                                otherUserName: 'John Landom',
                                time: '03:10',
                                lastMessage:
                                    'Hello, g please can you help me find a suitable driver that I could always search for when I wish to travel to Toronto',
                              ),
                              const Spacing(height: 16),
                              const ChatTile(
                                hasRead: true,
                                otherUserName: 'John Landom',
                                time: '03:10',
                                lastMessage:
                                    'Hello, g please can you help me find a suitable driver that I could always search for when I wish to travel to Toronto',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Placing the Chat App Bar
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CustomProfileAppbar(
                        title: locale.chats,
                        shadow: false,
                        trailing: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/check.svg',
                                height: 24.h,
                                width: 24.w,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            const Spacing(width: 12),
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/edit_square.svg',
                                height: 24.h,
                                width: 24.w,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
