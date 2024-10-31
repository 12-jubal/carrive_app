import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/conversation/conversation_state.dart';
import 'package:carrive_app/src/presentation/logic/conversation/converstion_cubit.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/conversation_actions.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/custom_buttons.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
        create: (context) => ConversationCubit(),
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
                    Spacer(),
                    ConversationActions(
                      onChange: (onChange) {},
                      messageTextController: cubit.messageTextController,
                      onSendMessage: () {},
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
