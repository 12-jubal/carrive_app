import 'package:carrive_app/src/presentation/logic/booking/booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingCubit extends Cubit<BookingState> {
  final CalendarController calendarController = CalendarController();
  String headerText = DateFormat('MMMM yyyy').format(DateTime.now());
  String weekNumber = Jiffy.now().weekOfYear.toString();
  BookingCubit() : super(BookingInitial());

  int weekOfYear(DateTime date) {
    // Calculate the first day of the year
    final startOfYear = DateTime(date.year, 1, 1);

    // Get the number of days between the start of the year and the given date
    final daysDifference = date.difference(startOfYear).inDays;

    // Calculate the week number (assuming weeks start on Monday)
    return (daysDifference ~/ 7) + 1;
  }
}
