import 'package:get/get.dart';

class TapController extends GetxController {
  int _x = 0;
  int get x => _x;

  RxInt _y = 0.obs;
  RxInt get y => _y;

  RxInt _z = 0.obs;
  int get z => _z.value;

  void increaseX() {
    _x++;
    update();
  }

  void decreaseX() {
    _x--;
    update();
  }

  void increaseY() {
    _y++;
  }

  void decreaseY() {
    _y--;
  }

  void totalXY() {
    _z.value = _x + _y.value;
  }
}
