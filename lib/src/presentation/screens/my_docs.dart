import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/documents/documents_cubit.dart';
import 'package:carrive_app/src/presentation/logic/documents/documents_state.dart';
import 'package:carrive_app/src/presentation/screens/upload_document.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/bloc_options.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/components/option.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDocuments extends StatelessWidget {
  final User user;
  const MyDocuments({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DocumentsCubit(user: user),
        child: BlocConsumer<DocumentsCubit, DocumentsState>(
          listener: (context, state) {},
          builder: (context, state) {
            // final cubit = context.read<DocumentsCubit>();
            final locale = AppLocalizations.of(context)!;
            return CustomScreen(
              isLoading: state is DocumentsLoading,
              loadingMessage: locale.loadingDocuments,
              child: Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      CustomAppbar(
                        onLeadingTap: () {
                          AppNavigator.pop(context);
                        },
                        leading: Text(locale.back),
                        title: locale.documents,
                        shadow: true,
                        trailing: Text(locale.confirm),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 24.w,
                        ),
                        child: Column(
                          children: [
                            BlocOption(
                              fullSeparator: true,
                              options: [
                                Option(
                                  hasIcon: false,
                                  onTap: () {
                                    AppNavigator.push(
                                        context, UploadDocument(user: user));
                                  },
                                  title: locale.driverLicense,
                                ),
                                Option(
                                  hasIcon: false,
                                  onTap: () {
                                    AppNavigator.push(
                                        context, UploadDocument(user: user));
                                  },
                                  title: locale.proofOfIdentity,
                                ),
                              ],
                            ),
                            const Spacing(height: 8),
                            Text(
                              locale.documentExplanation,
                              style: AppTextStyles.caption1.copyWith(
                                color: AppColors.black_700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
