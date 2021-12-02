
import 'package:get/get.dart';

class EditController extends GetxController{
var isObscure = true.obs;


  changeObscure(){
    isObscure.toggle();
  }
}