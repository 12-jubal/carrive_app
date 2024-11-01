import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/presentation/logic/search_ride/search_ride_cubit.dart';
import 'package:carrive_app/src/presentation/logic/search_ride/search_ride_state.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchRide extends StatelessWidget {
  const SearchRide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchRideCubit(),
      child: BlocConsumer<SearchRideCubit, SearchRideState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<SearchRideCubit>();
          final locale = AppLocalizations.of(context)!;
          return CustomScreen(
            isLoading: state is SearchRideLoading,
            loadingMessage: state is SearchRideLoading ? state.message : '',
            child: Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CustomAppbar(
                        onLeadingTap: () {
                          AppNavigator.pop(context);
                        },
                        leading: Text(locale.cancel),
                        title: locale.newRide,
                        shadow: true,
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
