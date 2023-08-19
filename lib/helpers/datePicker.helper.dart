import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:date_picker_module/date.picker.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:unicons/unicons.dart';

class DatePickerHelper {
  // open Date Only
  static Future<DateTime?> openDatePicker({
    DateTime? initDate,
    DateTime? maximumDate,
    DateTime? minimumDate,
  }) async =>
      await CustomBottomSheetHelper.show(
        title: "Choose a date".tr,
        icon: UniconsLine.calendar_alt,
        draggable: true,
        child: DatePicker(
          initDate: initDate ?? DateTime.now(),
          maximumDate: maximumDate ?? DateTime.now(),
          minimumDate: minimumDate ?? DateTime(1930, 1, 1),
        ),
      ) as DateTime?;

  // open Date and Time
  static Future<DateTime?> openDateAndTimePicker(DateTime initDate) async =>
      await CustomBottomSheetHelper.show(
        title: "Choose a date".tr,
        icon: UniconsLine.calendar_alt,
        draggable: true,
        child: DateAndTimePicker(initDate: initDate),
      ) as DateTime?;

  // open Date and Time
  static Future<DateRangePickerSelectionChangedArgs?> openCalendarPicker({
    DateTime? startDate,
    DateTime? endDate,
  }) async =>
      await CustomBottomSheetHelper.show(
        title: "Choose a date".tr,
        icon: UniconsLine.calendar_alt,
        draggable: true,
        child: CalendarPicker(
          startDate: startDate,
          endDate: endDate,
        ),
      ) as DateRangePickerSelectionChangedArgs?;

  // open Time
  static Future<DateTime?> openTimePicker([DateTime? initDate]) async =>
      await CustomBottomSheetHelper.show(
        title: "Choose a time".tr,
        icon: UniconsLine.clock_eight,
        draggable: true,
        child: TimePicker(
          initDate: initDate ?? DateTime.now(),
        ),
      ) as DateTime?;
}
