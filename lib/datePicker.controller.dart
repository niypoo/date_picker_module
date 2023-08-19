import 'package:get/get.dart';

class DatePickerController extends GetxController {
  //current date in edit case or chosen date
  Rx<dynamic> currentDate = Rx<dynamic>(null);

  //constructor
  DatePickerController({
    currentDate,
  }) {
    setCurrentData = currentDate;
  }

  //change current data
  set setCurrentData(newDate) => currentDate.value = newDate;

  //save function
  void save() => Get.back(result: currentDate.value);

  //cancel function
  void cancel() => Get.back();
}
