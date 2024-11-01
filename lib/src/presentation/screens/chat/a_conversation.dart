import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/conversation/conversation_state.dart';
import 'package:carrive_app/src/presentation/logic/conversation/converstion_cubit.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/conversation_actions.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Conversation extends StatelessWidget {
  final User me;
  final User other;
  const Conversation({
    super.key,
    required this.me,
    required this.other,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ConversationCubit(idReceiver: other.id),
        child: BlocConsumer<ConversationCubit, ConversationState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<ConversationCubit>();
            final locale = AppLocalizations.of(context)!;
            return CustomScreen(
              isLoading: state is ConversationLoading,
              loadingMessage: state is ConversationLoading ? state.message : '',
              child: Scaffold(
                body: Column(
                  children: [
                    ConversationAppBar(otherUserName: other.name),
                    if (state is ConversationLoaded)

                      // Text(state.conversation.messages),
                      if (state.conversation.messages.isEmpty)
                        Expanded(
                          child: Center(
                            child: Text(locale.noMessage),
                          ),
                        )
                      else
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ListView.builder(
                              reverse: true,
                              itemCount: state.conversation.messages.length,
                              itemBuilder: (context, index) {
                                final message = state.conversation.messages[
                                    state.conversation.messages.length -
                                        1 -
                                        index];
                                return Align(
                                  alignment: message.sender.id == me.id
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        message.sender.id == me.id
                                            ? CrossAxisAlignment.end
                                            : CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8.h,
                                          horizontal: 12.w,
                                        ),
                                        decoration: BoxDecoration(
                                          color: message.sender.id == me.id
                                              ? AppColors.primarySource
                                              : AppColors.black_100,
                                          borderRadius:
                                              message.sender.id == me.id
                                                  ? BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(16.r),
                                                      bottomLeft:
                                                          Radius.circular(16.r),
                                                      topRight:
                                                          Radius.circular(16.r),
                                                    )
                                                  : BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(16.r),
                                                      bottomRight:
                                                          Radius.circular(16.r),
                                                      topRight:
                                                          Radius.circular(16.r),
                                                    ),
                                        ),
                                        child: Text(
                                          message.content,
                                          style: AppTextStyles.body3.copyWith(
                                            color: message.sender.id == me.id
                                                ? AppColors.white
                                                : AppColors.black,
                                          ),
                                        ),
                                      ),
                                      const Spacing(height: 4),
                                      Text(
                                        '${message.time.hour}:${message.time.minute}',
                                        style: AppTextStyles.caption1.copyWith(
                                          color: AppColors.black_700,
                                        ),
                                      ),
                                      const Spacing(height: 8),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                    else
                      const Spacer(),
                    ConversationActions(
                      onChange: (onChange) {},
                      messageTextController: cubit.messageTextController,
                      onSendMessage: () {
                        if (state is ConversationLoaded) {
                          cubit.sendMessage(
                            idConversation: state.conversation.idConversation,
                            message: cubit.messageTextController.text.trim(),
                          );
                        }
                      },
                      onVoiceRecord: () {},
                      onPhotoCamera: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
