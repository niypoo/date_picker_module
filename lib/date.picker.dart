import 'package:date_picker_module/datePicker.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedIconButton.widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:unicons/unicons.dart';

class DateAndTimePicker extends StatelessWidget {
  final DateTime? initDate;
  const DateAndTimePicker({Key? key, this.initDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
      init: DatePickerController(currentDate: initDate),
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height:
                (context.isLandscape ? context.height : context.width) * 0.4,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: CupertinoDatePicker(
                initialDateTime: initDate ?? DateTime.now(),
                minimumDate: DateTime.now().subtract(const Duration(days: 160)),
                onDateTimeChanged: (DateTime newDate) =>
                    controller.setCurrentData = newDate,
              ),
            ),
          ),

          // BUTTON
          FlyElevatedIconButton.primary(
            icon: UniconsLine.check,
            title: "Save".tr,
            onPressed: controller.save,
          ),
        ],
      ),
    );
  }
}

class CalendarPicker extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  const CalendarPicker({
    Key? key,
    this.startDate,
    this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
      init: DatePickerController(),
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height:
                (context.isLandscape ? context.height : context.width) * 0.6,
            child: SfDateRangePicker(
              initialDisplayDate: startDate ?? DateTime.now(),
              initialSelectedRange:
                  PickerDateRange(startDate ?? DateTime.now(), endDate),
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) =>
                  controller.setCurrentData = args,
              selectionMode: DateRangePickerSelectionMode.range,
              selectionColor: Get.theme.primaryColor,
              todayHighlightColor: Get.theme.colorScheme.secondary,
              startRangeSelectionColor: Get.theme.primaryColor,
              endRangeSelectionColor: Get.theme.primaryColor,
              rangeSelectionColor: Get.theme.primaryColor.withOpacity(0.2),
            ),
          ),

          // BUTTON
          FlyElevatedIconButton.primary(
            icon: UniconsLine.check,
            title: "Save".tr,
            onPressed: controller.save,
          ),
        ],
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  final DateTime? initDate;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  const DatePicker({
    Key? key,
    this.initDate,
    this.minimumDate,
    this.maximumDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
      init: DatePickerController(currentDate: initDate),
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height:
                (context.isLandscape ? context.height : context.width) * 0.4,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initDate,
                minimumDate: minimumDate,
                maximumDate: maximumDate,
                onDateTimeChanged: (DateTime newDate) =>
                    controller.setCurrentData = newDate,
              ),
            ),
          ),
          // BUTTON
          FlyElevatedIconButton.primary(
            icon: UniconsLine.check,
            title: "Save".tr,
            onPressed: controller.save,
          ),
        ],
      ),
    );
  }
}

class TimePicker extends StatelessWidget {
  const TimePicker({Key? key, this.initDate}) : super(key: key);
  final DateTime? initDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<DatePickerController>(
        init: DatePickerController(currentDate: initDate),
        builder: (controller) => Column(
          children: [
            SizedBox(
              height:
                  (context.isLandscape ? context.height : context.width) * 0.4,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: CupertinoDatePicker(
                  initialDateTime: initDate,
                  mode: CupertinoDatePickerMode.time,
                  minimumDate:
                      DateTime.now().subtract(const Duration(days: 160)),
                  onDateTimeChanged: (DateTime newDate) =>
                      controller.setCurrentData = newDate,
                ),
              ),
            ),
            // BUTTON
            FlyElevatedIconButton.primary(
              icon: UniconsLine.check,
              title: "Save".tr,
              onPressed: controller.save,
            ),
          ],
        ),
      ),
    );
  }
}
