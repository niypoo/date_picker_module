import 'package:bottom_sheet_helper/models/actionSheetOption.model.dart';
import 'package:bottom_sheet_helper/services/actionSheet.helper.dart';
import 'package:bottom_sheet_helper/services/messageBottomSheet.helper.dart';
import 'package:date_helper/date.helper.dart';
import 'package:date_picker_module/models/durationDate.model.dart';
import 'package:date_picker_module/helpers/datePicker.helper.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DurationDataPickerHelper {
  // if user changes date
  Future<DurationData?> onChangeDate({
    DateTime? startDate,
    DateTime? endDate,
    String? currentValue,
  }) async {
    // open picker
    final dynamic payload = await ActionSheetHelper.show(
      title: 'Logs display date'.tr,
      subTitle: 'View records during a certain time period.'.tr,
      currentValue: currentValue,
      options: [
        ActionSheetOption(title: 'Today'.tr, value: 'Today'),
        ActionSheetOption(title: 'Yesterday'.tr, value: 'Yesterday'),
        ActionSheetOption(title: 'Week'.tr, value: 'Week'),
        ActionSheetOption(title: 'Month'.tr, value: 'Month'),
        ActionSheetOption(title: '3 Months'.tr, value: '3 Months'),
        ActionSheetOption(title: 'Custom Date'.tr, value: 'Custom Date'),
      ],
    );

    // skip
    if (payload == null) {
      return null;
    } else if (payload == 'Today') {
      return DurationData(
        title: payload,
        startDate: DateTime.now(),
      );
    }

    // Yesterday
    else if (payload == 'Yesterday') {
      return DurationData(
        title: payload,
        startDate: DateTime.now().subtract(const Duration(days: 1)),
      );
    }

    // Last Week
    else if (payload == 'Week') {
      return DurationData(
        title: payload,
        startDate: DateTime.now().subtract(const Duration(days: 7)),
        endDate: DateTime.now(),
      );
    }

    // Last Month
    else if (payload == 'Month') {
      return DurationData(
        title: payload,
        startDate: DateTime.now().subtract(const Duration(days: 30)),
        endDate: DateTime.now(),
      );
    }

    // Last 3 Months
    else if (payload == '3 Months') {
      return DurationData(
        title: payload,
        startDate: DateTime.now().subtract(const Duration(days: 90)),
        endDate: DateTime.now(),
      );
    }

    // Custom Date
    else if (payload == 'Custom Date') {
      // open calender with custom date
      return await onCustomDate(
        startDate: startDate,
        endDate: endDate,
      );
    }

    return null;
  }

  // if user changes date
  Future<DurationData?> onCustomDate({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    // open picker
    final DateRangePickerSelectionChangedArgs? payload =
        await DatePickerHelper.openCalendarPicker(
      startDate: startDate,
      endDate: endDate,
    );

    // skip
    if (payload == null) return null;

    // Prevent user show more than 30 days
    // to save some data
    // Check if end of date exist
    if (payload.value.endDate != null) {
      // different in days
      final int dateRangInDays =
          payload.value.endDate.difference(payload.value.startDate).inDays;
      if (dateRangInDays > 100) {
        MessageBottomSheetHelper.show(
          title: 'More than allowed'.tr,
          subTitle: 'You can view the logs within only 100 days not more.'.tr,
        );
        return null;
      }
    }

    // Assign start date
    startDate = payload.value.startDate;

    // assign end date
    endDate = payload.value.endDate;

    // if end date is not null and start is same end make
    // end is null
    if (endDate != null && DateHelper.isEqualDate(a: endDate, b: startDate)) {
      endDate = null;
    }

    // return
    return DurationData(
      startDate: startDate,
      endDate: endDate,
      title: "Custom Date",
    );
  }
}
