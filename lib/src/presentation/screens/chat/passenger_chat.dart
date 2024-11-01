import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/chat/chat_cubit_p.dart';
import 'package:carrive_app/src/presentation/logic/chat/chat_state.dart';
import 'package:carrive_app/src/presentation/logic/chat/chat_state_p.dart';
import 'package:carrive_app/src/presentation/screens/chat/a_conversation.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/chat_tile.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/custom_bottom_sheet.dart';
import 'package:carrive_app/src/utils/widgets/custom_buttons.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PassengerChat extends StatelessWidget {
  final User user;
  const PassengerChat({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => PChatCubit(locale: locale),
      child: BlocConsumer<PChatCubit, PChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<PChatCubit>();
          final locale = AppLocalizations.of(context)!;
          return CustomScreen(
            isLoading: state is PChatLoading,
            loadingMessage: state is PChatLoading ? state.message : '',
            child: Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                      top: 72.h,
                      left: 24.w,
                      right: 24.w,
                      bottom: 10.h,
                      child:
                          // SingleChildScrollView(
                          //   child:
                          Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: state is PSectionLoaded
                                  ? state.conversations.isEmpty
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // if (state is ChatLoaded && state is ConversationsLoaded)
                                            //   state.
                                            Image.asset(
                                              'assets/images/empty_mail.png',
                                              height: 200.h,
                                              width: 200.w,
                                            ),
                                            const Spacing(height: 24),
                                            Text(
                                              locale.noChatsRecommendations,
                                              textAlign: TextAlign.center,
                                              style:
                                                  AppTextStyles.body3.copyWith(
                                                color: AppColors.black_700,
                                              ),
                                            ),
                                            const Spacing(height: 24),

                                            CustomButton(
                                              onTap: () {
                                                CustomUserBottomSheet.showusers(
                                                  context,
                                                  title: locale.newMessage,
                                                  searchHintText:
                                                      locale.searchUser,
                                                  onChanged: (value) {},
                                                  me: user,
                                                  users: state is ChatLoaded
                                                      ? state.users
                                                      : [],
                                                );
                                              },
                                              label: locale.startChat,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            // Search Text Field
                                            CustomTextField(
                                              hint: 'Search',
                                              onChanged: (value) {},
                                              textEditingController: cubit
                                                  .searchTextEditingController,
                                              suffix: true,
                                              suffixIconString:
                                                  'assets/icons/search.svg',
                                            ),
                                            const Spacing(height: 24),
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount:
                                                    state.conversations.length,
                                                itemBuilder: (context, index) {
                                                  final convo =
                                                      state.conversations[state
                                                              .conversations
                                                              .length -
                                                          1 -
                                                          index];
                                                  return ChatTile(
                                                    onTap: () {
                                                      AppNavigator.push(
                                                          context,
                                                          Conversation(
                                                              me: user,
                                                              other:
                                                                  convo.user1));
                                                    },
                                                    otherUserName:
                                                        convo.user1.name,
                                                    time:
                                                        "${convo.messages.last.time.hour} : ${convo.messages.last.time.minute}",
                                                    lastMessage: convo
                                                        .messages.last.content,
                                                    hasRead: true,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                  : null),
                      // ),
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
