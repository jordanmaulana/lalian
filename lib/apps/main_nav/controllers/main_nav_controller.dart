import 'package:get/get.dart';

class MainNavController extends GetxController {
  var index = 0.obs;

  void setIndex(int v) {
    index(v);
  }
}
