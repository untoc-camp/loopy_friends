import 'package:get/get.dart';
import '../constants/url.dart';
import '../model/test_model.dart';

class TestApi extends GetConnect {
  Future<Response> getTest() async {
    return await get('${Urls.apiUrl}items');
  }
}
