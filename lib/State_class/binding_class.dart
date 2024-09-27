
import 'package:foodhup/State_class/Statemanage_class.dart';
import 'package:get/get.dart';

class BindingClass extends Bindings{
  @override
  void dependencies() {
    Get.put<ManageState>(ManageState());
  }
}