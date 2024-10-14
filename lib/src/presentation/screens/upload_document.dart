import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/documents/documents_state.dart';
import 'package:carrive_app/src/presentation/logic/upload/upload_cubit.dart';
import 'package:carrive_app/src/presentation/logic/upload/upload_state.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/doc_uploader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadDocument extends StatelessWidget {
  final User user;
  const UploadDocument({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
        create: (context) => UploadCubit(localizations: locale),
        child: BlocConsumer<UploadCubit, UploadState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<UploadCubit>();
            final locale = AppLocalizations.of(context)!;
            String? uploadOption = state.option;
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
                        leading: SvgPicture.asset(
                          'assets/icons/close.svg',
                          width: 24.w,
                          height: 24.h,
                          colorFilter: const ColorFilter.mode(
                            AppColors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                        title: locale.documents,
                        shadow: true,
                        trailing: SvgPicture.asset(
                          'assets/icons/free_check.svg',
                          width: 24.w,
                          height: 24.h,
                          colorFilter: const ColorFilter.mode(
                            AppColors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 16.h,
                        ),
                        child: Column(
                          children: [
                            DocUploader(
                              uploadInstruction: locale.uploadInstruction,
                              supportedFormat: locale.supportedFormat,
                              options: [
                                locale.uploadImage,
                                locale.uploadFile,
                              ],
                              onChanged: cubit.selectOption,
                              selectedValue: uploadOption,
                            ),
                            Text(uploadOption ?? ''),
                            // CustomButton(
                            //     onTap: () {
                            //       cubit.pickImage();
                            //     },
                            //     label: 'Pick Image'),
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
