import 'package:get/get.dart';

class TestController extends GetxController {
  final RxInt idx = 0.obs;
  final List<String> list = ["https://picsum.photos/250?image=9", "https://picsum.photos/250?image=6"];
  final RxString name = "https://picsum.photos/250?image=9".obs;
  final RxBool isClick = false.obs;
  final RxBool bookMarkClick = false.obs;
  final RxBool moreClick = false.obs;
  
  final story = [
    {
      "name": "story",
    },
    {
      "name": "story",
    },
    {
      "name": "story",
    },
    {
      "name": "story",
    },
    {
      "name": "story",
    },
    {
      "name": "story",
    },
    {
      "name": "story",
    },
    {
      "name": "story",
    },
    {
      "name": "story",
    },
    {
      "name": "story",
    },
  ];
  void rightClick() {
    if (idx.value < list.length - 1) {
      idx.value++;
      name.value = list[idx.value];
    }
  }

  void leftClick() {
    if (idx.value > 0) {
      idx.value--;
      name.value = list[idx.value];
    }
  }

  void click() {
    isClick.value = !isClick.value;
  }

  void bookMark() {
    bookMarkClick.value = !bookMarkClick.value;
  }

  void more() {
    moreClick.value = !moreClick.value;
  }

  get nameValue => name.value;
  get idxValue => idx.value;
  get isClickValue => isClick.value;
  get bookMarkClickValue => bookMarkClick.value;
  get moreClickValue => moreClick.value;
}
